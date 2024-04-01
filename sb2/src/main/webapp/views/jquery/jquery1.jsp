<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2024-03-27
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .form-bg:focus {
        background: blue;
    }
</style>
<script>
    let jQuery1 = {
        init: function () {
            $('h2').hover(
                // 여기서 this는 h2
                function () {
                    $(this).text('in');
                },
                function () {
                    $(this).text('out');
                }
            );

            $('#id').focus(function () {
                $(this).addClass('form-bg');
            });
            $('#id').blur(function () {
                $(this).removeClass('form-bg');
            });

            $('#id').keyup(function () {
                let id = $(this).val();
                $('#pwd').val(id);
            });
            $('#login_form > button').click(function(){
                $('.fakeimg').display("none");
            })
        }
    }
    $(function () {
        jQuery1.init();
    });

</script>
<div class="container">
    <h2>jQuery1 Page</h2>
    <div class="fakeimg">Fake Image</div>
    <form id="login_form">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="text" class="form-control" id="id" placeholder="Enter id" name="id">

        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">

        </div>

        <button type="button" class="btn btn-primary">LOGIN</button>
    </form>
</div>