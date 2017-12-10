<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Авторизация пользователя</title>
<#include "parts/part_links.ftl">

</head>

<body onload='document.f.username.focus();'>
<div class="container">

<#include "parts/part_head.ftl">
<#include "parts/part_nav.ftl">

    <h3>Регистрация пользователя</h3>

    <#if validationErrors??>
        <#list validationErrors as validationError>
            <p style="color: #b21f2d">${validationError}</p>
        </#list>
    </#if>

    <form name='f' action='/registration' method='POST'>
        <table>
            <tr><td>Логин :</td><td><input type='text' name='username' value=''></td></tr>
            <tr><td>Пароль :</td><td><input type='password' name='password'/></td></tr>
            <tr><td>Подтверждение Пароля :</td><td><input type='password' name='passwordConfirmation'/></td></tr>

            <tr><td colspan='2'><input name="submit" type="submit" value="Register"/></td></tr>
        </table>
    </form>

</div>
</body>

</html>