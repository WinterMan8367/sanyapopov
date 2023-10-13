<?
    session_start();
    require_once('functions.php');

    if (empty($_SESSION))
    {
        if (!empty($_POST))
        {
            $name = $_POST['name'];
            $phone = $_POST['phone'];
            $password = $_POST['password'];
            $repeat_password = $_POST['repeat_password'];
    
            if (!empty($name) and !empty($phone) and !empty($password) and !empty($repeat_password))
            {
                $result = registration($name, $phone, $password, $repeat_password);
        
                if (is_array($result))
                {
                    $_SESSION['user'] = $result;
                    header('Location: /');
                    exit;
                }
                else
                {
                    echo $result;
                }
            }
            else
            {
                echo $result;
            }
        }
    }
    else
    {
        header("Location: /index.php");
        exit;
    }
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
            <input name="name" type="text" placeholder="Ваше имя">
            <input name="phone" type="tel" placeholder="Ваш номер телефона">
            <input name="password" type="password" placeholder="Пароль">
            <input name="repeat_password" type="password" placeholder="Повторите пароль">
            <input type="submit" value="Зарегистрироваться">
        </form>
    </body>
</html>
<? require_once('buttons.php'); ?>