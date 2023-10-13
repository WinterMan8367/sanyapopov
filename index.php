<?
    session_start();
    require_once('functions.php');

    if (!empty($_GET['logout']))
    {
        unset($_SESSION['user_info']);
        $_SESSION = [];
        session_destroy();
        header("Location: /");
    }

?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Вкусно - и точка</title>
    </head>
    <body>
        <p>
            Добро пожаловать, <?= (!empty($_SESSION)) ? $_SESSION['user']['name'] : "аноним" ?>!
        </p>
        <p>
            <a href="?logout=1" style="color: blue; text-decoration: underline">Выйти из аккаунта</a>
        </p>
        <h1>Бургеры и роллы</h1>
        <?
            $burgers = [];
            $i = 1;

            do
            {
                $arr = get_product($i);

                if (!empty($arr['id']))
                {
                    if ($arr['category_id'] == 1)
                    {
                        $burgers[$i] = $arr;
                    }
                }
                else
                {
                    break;
                }

                $i += 1;
            }
            while (true);
        ?>
        <pre>
            <? var_dump(get_all_products_in_category(1)) ?>
        </pre>
    </body>
</html>
<? require_once('buttons.php'); ?>