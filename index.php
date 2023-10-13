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
        <style>
            .grid {
                display: grid;
                grid-template-columns: 1fr 1fr 1fr 1fr;
            }
            .product {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
            }
        </style>
        <div class="grid">
        <?
            $products = get_all_products_in_category(1);

            foreach ($products as $elem):
        ?>
            <div class="product">
                <div style="background-color: purple; width: 250px; height: 250px;">Image</div>
                <div><?=$elem['name']?></div>
                <div><?=$elem['price']?> ₽</div>
            </div>
        <? endforeach ?>
        </div>
        <h1>Напитки</h1>
        <div class="grid">
        <?
            $products = get_all_products_in_category(2);

            foreach ($products as $elem):
        ?>
            <div class="product">
                <div style="background-color: purple; width: 250px; height: 250px;">Image</div>
                <div><?=$elem['name']?></div>
                <div><?=$elem['price']?> ₽</div>
            </div>
        <? endforeach ?>
        </div>
        <h1>Картофель, стартеры и салаты</h1>
        <div class="grid">
        <?
            $products = get_all_products_in_category(3);

            foreach ($products as $elem):
        ?>
            <div class="product">
                <div style="background-color: purple; width: 250px; height: 250px;">Image</div>
                <div><?=$elem['name']?></div>
                <div><?=$elem['price']?> ₽</div>
            </div>
        <? endforeach ?>
        </div>
        <h1>Десерты</h1>
        <div class="grid">
        <?
            $products = get_all_products_in_category(4);

            foreach ($products as $elem):
        ?>
            <div class="product">
                <div style="background-color: purple; width: 250px; height: 250px;">Image</div>
                <div><?=$elem['name']?></div>
                <div><?=$elem['price']?> ₽</div>
            </div>
        <? endforeach ?>
        </div>
        <h1>Соусы</h1>
        <div class="grid">
        <?
            $products = get_all_products_in_category(5);

            foreach ($products as $elem):
        ?>
            <div class="product">
                <div style="background-color: purple; width: 250px; height: 250px;">Image</div>
                <div><?=$elem['name']?></div>
                <div><?=$elem['price']?> ₽</div>
            </div>
        <? endforeach ?>
        </div>
    </body>
</html>
<? require_once('buttons.php'); ?>
<!--- s --->