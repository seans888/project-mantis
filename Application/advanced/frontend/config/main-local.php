<?php

$config = [
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
<<<<<<< HEAD
            'cookieValidationKey' => 'xNsdLBZqnEn2v8dgcqaz0qkFPSG0J-qj',
=======
            'cookieValidationKey' => 'A3NyvXdth0IeXiGgji0G0788LWVvP0cP',
>>>>>>> d9329bd962098f2c7da5f93d1490622868073076
        ],
    ],
];

if (!YII_ENV_TEST) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
    ];
    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
    ];
}

return $config;
