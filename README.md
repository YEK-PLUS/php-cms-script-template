# YekCMS | PHP Web Application Framework
[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/YEK-PLUS/YekCMS) 
[![Build Status](https://travis-ci.org/YEK-PLUS/YekCMS.png?branch=master)](https://travis-ci.org/YEK-PLUS/YekCMS) 
[![LICENCE](https://img.shields.io/github/license/YEK-PLUS/YekCMS.svg)](https://github.com/YEK-PLUS/YekCMS/blob/master/LICENSE)



YekCMS is an open source CMS system for your web applications and has included frontend and backed packages for convenience.


|Frontend|Backend|
|--------|-------|
|[Jquery]|[AltoRouter]|
|[Bootstrap]|[Medoo]|
|[Materializecss]||


## Methods
Create new method and call this method in your page file

#### Normal Method

```php
$this->addMethod("HelloWord",function(){
  echo 'Hello Word';
});
```

#### With Param

If you want the call function with params ,just type `$params = null` in function construction.

```php
$this->addMethod("HelloWorld",function($params = null){
    # get param1 with setParams function
    # setParams function arguments
    # $params , indexed or associative arrays
    # int , value key
    $param1 = setParams($params,0);
    echo $param1;
});
```

## Page Structure and Method Calling
`/src/methods/HelloWorld.php`
```php
<?php
$this->addMethod("HelloWorld",function(){
  echo 'Hello World';
});
?>
```
And include this method from `/src/methods/load.php`

```php
...
include __DIR__.'/HelloWorld.php';
```
`/src/pages/home.php`
```html
<html>
    <head>
        <?php
        $this->method->meta();
        $this->method->css_lib();
        $this->method->css_local();
        ?>
        <title><?= SITE_NAME ?></title>
    </head>
    <body>
        <?php $this->method->HelloWorld(); ?>
    </body>
<?php
$this->method->js_lib();
$this->method->js_local();
?>
</html>
```








File Structure
```
.
├── LICENSE
├── README.md
├── asset
│   ├── css
│   │   └── CSS Files Here
│   ├── js
│   │   └── JS Files Here
│   └── svg
|       └── JS Files Here
├── lib
│   ├── AltoRouter
│   ├── Bootstrap
│   ├── Jquery
│   ├── Medoo
│   ├── Tailwind
│   ├── Font Awesome
│   └── materialize
└── src
    ├── admin
    │   └── admin cms area
    ├── methods
    │   └── method files
    ├── pages
    │   └── Pages 404, home etc..
    └── functions page , router etc..
```



   [Jquery]: <https://github.com/jquery/jquery>
   [Bootstrap]: <https://github.com/twbs/bootstrap>
   [Materializecss]: <https://github.com/Dogfalo/materialize>
   [AltoRouter]: <https://github.com/dannyvankooten/AltoRouter>
   [Medoo]: <https://github.com/catfan/Medoo>
