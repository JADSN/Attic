<?php
/**
* Tutorial jSON
*/


/* postgreSQL TABLE

 CREATE TABLE jogos
(
id serial NOT NULL,
nome text,
console text,
preco numeric(10,2)
)
*/


//Definir formato de arquivo
header('Content-Type:' . "text/plain");

$host	= "localhost"; // IP do Banco
$user 	= "postgres"; // Usuário
$pswd 	= "postgres"; // Senha
$dbname	= "tutoriais"; // Banco
$con 	= null; // Conexão

$con = @pg_connect("host=$host user=$user password=$pswd dbname=$dbname") or die (pg_last_error($con));

//@pg_close($con); //Encerrrar Conexão

if(!$con) {
	echo '[{"erro": "Não foi possível conectar ao banco"';
	echo '}]';
} else {
	//SQL de BUSCA LISTAGEM
	$sql 	= "SELECT * FROM jogos ORDER BY console";
	$result = pg_query($sql); //Executar a SQL
	$n 		= pg_num_rows($result); //Número de Linhas retornadas

	if (!$result) {
		//Caso não haja retorno
		echo '[{"erro": "Há algum erro com a busca. Não retorna resultados"';
		echo '}]';
	}else if($n<1) {
		//Caso não tenha nenhum item
		echo '[{"erro": "Não há nenhum dado cadastrado"';
		echo '}]';
	}else {
		//Mesclar resultados em um array
		for($i = 0; $i<$n; $i++) {
			$dados[] = pg_fetch_assoc($result, $i);
		}
		
		echo json_encode($dados, JSON_PRETTY_PRINT);
	}
}
?>