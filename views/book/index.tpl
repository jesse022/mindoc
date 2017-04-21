<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>我的文档 - Powered by MinDoc</title>

    <!-- Bootstrap -->
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link href="/static/css/main.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="/static/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="manual-reader">
    {{template "widgets/header.tpl" .}}
    <div class="container manual-body">
        <div class="row">
            <div class="page-left">
                <ul class="menu">
                    <li class="active"><a href="{{urlfor "SettingController.Index"}}" class="item"><i class="fa fa-sitemap" aria-hidden="true"></i> 我的项目</a> </li>
                </ul>
            </div>
            <div class="page-right">
                <div class="m-box">
                    <div class="box-head">
                        <strong class="box-title">项目列表</strong>
                        <button type="button" data-toggle="modal" data-target="#addBookDialogModal" class="btn btn-success btn-sm pull-right">添加项目</button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="book-list">
                        <div class="list-item">
                            <div class="book-title">
                                <div class="pull-left">
                                    <a href="{{urlfor "BookController.Dashboard" ":key" "test"}}" title="项目概要" data-toggle="tooltip">
                                        <i class="fa fa-unlock" aria-hidden="true"></i> 测试项目
                                    </a>
                                </div>
                                <div class="pull-right">
                                    <a href="{{urlfor "DocumentController.Index" ":key" "test"}}" title="查看文档" data-toggle="tooltip"><i class="fa fa-eye"></i> 查看文档</a>
                                    <a href="{{urlfor "BookController.Edit" ":key" "test" ":id" "1"}}" title="编辑文档" data-toggle="tooltip"><i class="fa fa-edit" aria-hidden="true"></i> 编辑文档</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="desc-text">
                                <a href="{{urlfor "BookController.Dashboard" ":key" "test"}}" title="项目概要" style="font-size: 12px;" target="_blank">
                                    这是一个测试用户测试项目
                                </a>

                            </div>
                            <div class="info">
                                <span title="创建时间" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-clock-o"></i> 2016/11/27 06:09</span>
                                <span title="创建者" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-user"></i> admin</span>
                                <span title="文档数量" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-pie-chart"></i> 4</span>
                                <span title="项目角色" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-user-secret"></i>  拥有者</span>
                                <span title="最后编辑" data-toggle="tooltip" data-placement="bottom"><i class="fa fa-pencil"></i> 最后编辑: admin 于 2017-04-20 12:19</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{template "widgets/footer.tpl" .}}
</div>
<!-- Modal -->
<div class="modal fade" id="addBookDialogModal" tabindex="-1" role="dialog" aria-labelledby="addBookDialogModalLabel">
    <div class="modal-dialog" role="document" style="width: 655px">
        <form method="post" autocomplete="off" action="{{urlfor "BookController.Create"}}" id="addBookDialogForm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加项目</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="标题(不超过100字)" name="book_name" id="bookName">
                </div>
                <div class="form-group">
                    <div class="pull-left" style="padding: 7px 5px 6px 0">
                        {{.BaseUrl}}{{urlfor "DocumentController.Index" ":key" ""}}
                    </div>
                    <input type="text" class="form-control pull-left" style="width: 220px;vertical-align: middle" placeholder="项目唯一标识(不能超过50字)" name="identify" id="identify">
                    <div class="clearfix"></div>
                    <p class="text" style="font-size: 12px;color: #999;margin-top: 6px;">文档标识只能包含小写字母、数字，以及“-”和“_”符号,并且只能小写字母打头</p>

                </div>
                <div class="form-group">
                    <textarea name="description" id="description" class="form-control" placeholder="描述信息不超过500个字符" style="height: 90px;"></textarea>
                </div>
                <div class="form-group">
                    <div class="col-lg-6">
                        <label>
                            <input type="radio" name="privately_owned" value="0" checked> 公开<span class="text">(任何人都可以访问)</span>
                        </label>
                    </div>
                    <div class="col-lg-6">
                        <label>
                            <input type="radio" name="privately_owned" value="1"> 私有<span class="text">(只要参与者或使用令牌才能访问)</span>
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="form-group">
                    <div class="col-lg-3">
                        <label>
                            <input type="radio" checked name="comment_status" value="open">允许所有人评论<span class="text"></span>
                        </label>
                    </div>
                    <div class="col-lg-3">
                        <label>
                            <input type="radio"  name="comment_status" value="">关闭评论<span class="text"></span>
                        </label>
                    </div>
                    <div class="col-lg-3">
                        <label>
                            <input type="radio" name="comment_status" value="">仅允许参与者评论<span class="text"></span>
                        </label>
                    </div>
                    <div class="col-lg-3">
                        <label>
                            <input type="radio" name="comment_status" value="registered_only">仅允许注册者评论<span class="text"></span>
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
                <span id="form-error-message"></span>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-success">保存</button>
            </div>
        </div>
        </form>
    </div>
</div><!--END Modal-->

<script src="/static/jquery/1.12.4/jquery.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/js/jquery.form.js" type="text/javascript"></script>
<script src="/static/js/main.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#addBookDialogForm").ajaxForm({
            beforeSubmit : function () {
                var bookName = $.trim($("#bookName").val());
                if(bookName === ""){
                    return showError("项目标题不能为空")
                }
                if(bookName.length > 100){
                    return showError("项目标题必须小于100字符");
                }

                var identify = $.trim($("#identify").val());
                if(identify === ""){
                    return showError("项目标识不能为空");
                }
                if(identify.length > 50){
                    return showError("项目标识必须小于50字符");
                }
                var description = $.trim($("#description").val());

                if(description.length > 500){
                    return showError("描述信息不超过500个字符");
                }
                return showSuccess("");
            },
            success : function (res) {

            }
        });
    });
</script>
</body>
</html>