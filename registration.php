<?
    require_once('functions.php');
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Вкусно - и точка: регистрация</title>
    </head>
    <body>
        <h1>Регистрация</h1>
        <form action="" method="POST" style="display: flex; flex-direction: column; align-items: flex-start; gap: 10px;">
            <input name="phone" type="tel" placeholder="Ваш номер телефона">
            <input name="name" type="text" placeholder="Ваше имя">
            <input name="password" type="password" placeholder="Пароль">
            <input name="repeat_password" type="password" placeholder="Повторите пароль">
            <input type="submit" value="Зарегистрироваться">
        </form>
    </body>
</html>
<? require_once('buttons.php'); ?>