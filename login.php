<?
    session_start();
    require_once('functions.php');

    if (!empty($_SESSION))
    {
        header("Location: /");
        exit;
    }
    else
    {
        if (!empty($_POST['phone']) and !empty($_POST['password']))
        {
            $phone = $_POST['phone'];
            $password = $_POST['password'];
    
            $arr = authorization($phone, $password);
            if (!empty($arr))
            {
                $_SESSION['user'] = get_user_info($arr['password_hash']);
                $_SESSION['coupon'] = get_coupon($_SESSION['user']['id']);
                header("Location: /");
                exit;
            }
            else
            {
                echo "Неправильный логин или пароль";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Вкусно - и точка: вход</title>
    </head>
    <body>
        <h1>Вход</h1>
        <form action="" method="POST" style="display: flex; flex-direction: column; align-items: flex-start; gap: 10px;">
            <input name="phone" type="tel" placeholder="Ваш номер телефона">
            <input name="password" type="password" placeholder="Пароль">
            <input type="submit" value="Войти">
        </form>
    </body>
</html>
<? require_once('buttons.php'); ?>