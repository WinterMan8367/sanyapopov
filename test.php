<?
    session_start();
    require_once('functions.php');
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Тестовая страница</title>
    </head>
    <body>
        <pre>
        <?
            var_export(get_product(2));
        ?>
        <br>
        <?
            if (!empty($_SESSION))
            {
                var_dump($_SESSION);
            }
            else
            {
                echo "Пустая сессия!";
            }
        ?>
        </pre>
    </body>
</html>
<? require_once('buttons.php'); ?>