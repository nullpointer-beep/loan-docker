webpackJsonp([4,41,42],{A5ML:function(e,t,a){var l=a("ijIH");"string"==typeof l&&(l=[[e.i,l,""]]),l.locals&&(e.exports=l.locals);a("rjj0")("a7913e8c",l,!0,{})},AytH:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var l={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:"上传文件","close-on-click-modal":!1,visible:e.visible},on:{close:e.closeHandle,"update:visible":function(t){e.visible=t}}},[a("el-upload",{staticStyle:{"text-align":"center"},attrs:{drag:"",action:e.url,"before-upload":e.beforeUploadHandle,"on-success":e.successHandle,multiple:"","file-list":e.fileList}},[a("i",{staticClass:"el-icon-upload"}),e._v(" "),a("div",{staticClass:"el-upload__text"},[e._v("将文件拖到此处，或"),a("em",[e._v("点击上传")])]),e._v(" "),a("div",{staticClass:"el-upload__tip",attrs:{slot:"tip"},slot:"tip"},[e._v("只支持jpg、png、gif格式的图片！")])])],1)},staticRenderFns:[]},i=a("VU/8")({data:function(){return{visible:!1,url:"",num:0,successNum:0,fileList:[]}},methods:{init:function(e){this.url=this.$http.BASE_URL+"/sys/oss/upload?token="+this.$cookie.get("token"),this.visible=!0},beforeUploadHandle:function(e){if("image/jpg"!==e.type&&"image/jpeg"!==e.type&&"image/png"!==e.type&&"image/gif"!==e.type)return this.$message.error("只支持jpg、png、gif格式的图片！"),!1;this.num++},successHandle:function(e,t,a){var l=this;this.fileList=a,this.successNum++,e&&0===e.code?this.num===this.successNum&&this.$confirm("操作成功, 是否继续操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).catch(function(){l.visible=!1}):this.$message.error(e.msg)},closeHandle:function(){this.fileList=[],this.$emit("refreshDataList")}}},l,!1,null,null,null);t.default=i.exports},"C+ej":function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var l={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-dialog",{attrs:{title:"云存储配置","close-on-click-modal":!1,visible:e.visible},on:{"update:visible":function(t){e.visible=t}}},[a("el-form",{ref:"dataForm",attrs:{model:e.dataForm,rules:e.dataRule,"label-width":"120px"},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.dataFormSubmit()}}},[a("el-form-item",{attrs:{size:"mini",label:"存储类型"}},[a("el-radio-group",{model:{value:e.dataForm.type,callback:function(t){e.$set(e.dataForm,"type",t)},expression:"dataForm.type"}},[a("el-radio",{attrs:{label:1}},[e._v("七牛")]),e._v(" "),a("el-radio",{attrs:{label:2}},[e._v("阿里云")]),e._v(" "),a("el-radio",{attrs:{label:3}},[e._v("腾讯云")]),e._v(" "),a("el-radio",{attrs:{label:4}},[e._v("服务器")])],1)],1),e._v(" "),1===e.dataForm.type?[a("el-form-item",{attrs:{label:"域名"}},[a("el-input",{attrs:{placeholder:"七牛绑定的域名"},model:{value:e.dataForm.qiniuDomain,callback:function(t){e.$set(e.dataForm,"qiniuDomain",t)},expression:"dataForm.qiniuDomain"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"路径前缀"}},[a("el-input",{attrs:{placeholder:"不设置默认为空"},model:{value:e.dataForm.qiniuPrefix,callback:function(t){e.$set(e.dataForm,"qiniuPrefix",t)},expression:"dataForm.qiniuPrefix"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"AccessKey"}},[a("el-input",{attrs:{placeholder:"七牛AccessKey"},model:{value:e.dataForm.qiniuAccessKey,callback:function(t){e.$set(e.dataForm,"qiniuAccessKey",t)},expression:"dataForm.qiniuAccessKey"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"SecretKey"}},[a("el-input",{attrs:{placeholder:"七牛SecretKey"},model:{value:e.dataForm.qiniuSecretKey,callback:function(t){e.$set(e.dataForm,"qiniuSecretKey",t)},expression:"dataForm.qiniuSecretKey"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"空间名"}},[a("el-input",{attrs:{placeholder:"七牛存储空间名"},model:{value:e.dataForm.qiniuBucketName,callback:function(t){e.$set(e.dataForm,"qiniuBucketName",t)},expression:"dataForm.qiniuBucketName"}})],1)]:2===e.dataForm.type?[a("el-form-item",{attrs:{label:"域名"}},[a("el-input",{attrs:{placeholder:"阿里云绑定的域名"},model:{value:e.dataForm.aliyunDomain,callback:function(t){e.$set(e.dataForm,"aliyunDomain",t)},expression:"dataForm.aliyunDomain"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"路径前缀"}},[a("el-input",{attrs:{placeholder:"不设置默认为空"},model:{value:e.dataForm.aliyunPrefix,callback:function(t){e.$set(e.dataForm,"aliyunPrefix",t)},expression:"dataForm.aliyunPrefix"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"EndPoint"}},[a("el-input",{attrs:{placeholder:"阿里云EndPoint"},model:{value:e.dataForm.aliyunEndPoint,callback:function(t){e.$set(e.dataForm,"aliyunEndPoint",t)},expression:"dataForm.aliyunEndPoint"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"AccessKeyId"}},[a("el-input",{attrs:{placeholder:"阿里云AccessKeyId"},model:{value:e.dataForm.aliyunAccessKeyId,callback:function(t){e.$set(e.dataForm,"aliyunAccessKeyId",t)},expression:"dataForm.aliyunAccessKeyId"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"AccessKeySecret"}},[a("el-input",{attrs:{placeholder:"阿里云AccessKeySecret"},model:{value:e.dataForm.aliyunAccessKeySecret,callback:function(t){e.$set(e.dataForm,"aliyunAccessKeySecret",t)},expression:"dataForm.aliyunAccessKeySecret"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"BucketName"}},[a("el-input",{attrs:{placeholder:"阿里云BucketName"},model:{value:e.dataForm.aliyunBucketName,callback:function(t){e.$set(e.dataForm,"aliyunBucketName",t)},expression:"dataForm.aliyunBucketName"}})],1)]:3===e.dataForm.type?[a("el-form-item",{attrs:{label:"域名"}},[a("el-input",{attrs:{placeholder:"腾讯云绑定的域名"},model:{value:e.dataForm.qcloudDomain,callback:function(t){e.$set(e.dataForm,"qcloudDomain",t)},expression:"dataForm.qcloudDomain"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"路径前缀"}},[a("el-input",{attrs:{placeholder:"不设置默认为空"},model:{value:e.dataForm.qcloudPrefix,callback:function(t){e.$set(e.dataForm,"qcloudPrefix",t)},expression:"dataForm.qcloudPrefix"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"AppId"}},[a("el-input",{attrs:{placeholder:"腾讯云AppId"},model:{value:e.dataForm.qcloudAppId,callback:function(t){e.$set(e.dataForm,"qcloudAppId",t)},expression:"dataForm.qcloudAppId"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"SecretId"}},[a("el-input",{attrs:{placeholder:"腾讯云SecretId"},model:{value:e.dataForm.qcloudSecretId,callback:function(t){e.$set(e.dataForm,"qcloudSecretId",t)},expression:"dataForm.qcloudSecretId"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"SecretKey"}},[a("el-input",{attrs:{placeholder:"腾讯云SecretKey"},model:{value:e.dataForm.qcloudSecretKey,callback:function(t){e.$set(e.dataForm,"qcloudSecretKey",t)},expression:"dataForm.qcloudSecretKey"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"BucketName"}},[a("el-input",{attrs:{placeholder:"腾讯云BucketName"},model:{value:e.dataForm.qcloudBucketName,callback:function(t){e.$set(e.dataForm,"qcloudBucketName",t)},expression:"dataForm.qcloudBucketName"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"Bucket所属地区"}},[a("el-input",{attrs:{placeholder:"如：sh（可选值 ，华南：gz 华北：tj 华东：sh）"},model:{value:e.dataForm.qcloudRegion,callback:function(t){e.$set(e.dataForm,"qcloudRegion",t)},expression:"dataForm.qcloudRegion"}})],1)]:e._e(),e._v(" "),4===e.dataForm.type?[a("el-form-item",{attrs:{label:"路径"}},[a("el-input",{attrs:{placeholder:"本地存储路径"},model:{value:e.dataForm.diskPath,callback:function(t){e.$set(e.dataForm,"diskPath",t)},expression:"dataForm.diskPath"}})],1),e._v(" "),a("el-form-item",{attrs:{label:"代理服务器"}},[a("el-input",{attrs:{placeholder:"本地存储代理服务器"},model:{value:e.dataForm.proxyServer,callback:function(t){e.$set(e.dataForm,"proxyServer",t)},expression:"dataForm.proxyServer"}})],1)]:e._e()],2),e._v(" "),a("span",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[a("el-button",{on:{click:function(t){e.visible=!1}}},[e._v("取消")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.dataFormSubmit()}}},[e._v("确定")])],1)],1)},staticRenderFns:[]},i=a("VU/8")({data:function(){return{visible:!1,dataForm:{},dataRule:{}}},methods:{init:function(e){var t=this;this.visible=!0,this.$http({url:"/sys/oss/config",method:"get"}).then(function(e){var a=e.data;t.dataForm=a&&0===a.code?a.config:[]})},dataFormSubmit:function(){var e=this;this.$refs.dataForm.validate(function(t){t&&e.$http({url:"/sys/oss/saveConfig",method:"post",data:e.dataForm}).then(function(t){var a=t.data;a&&0===a.code&&(e.$message({message:"操作成功",type:"success",duration:1500}),e.visible=!1)})})}}},l,!1,null,null,null);t.default=i.exports},dIih:function(e,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var l=a("C+ej"),i=a("AytH"),o={data:function(){return{searchForm:{url:""},dataList:[],pageIndex:1,pageSize:10,totalPage:0,dataListSelections:[],configVisible:!1,uploadVisible:!1}},components:{Config:l.default,Upload:i.default},activated:function(){this.getDataList()},methods:{getDataList:function(){var e=this;this.$http({url:"/sys/oss/list",method:"get",params:{page:this.pageIndex,limit:this.pageSize,url:this.searchForm.url}}).then(function(t){var a=t.data;a&&0===a.code?(e.dataList=a.page.records,e.totalPage=a.page.total):(e.dataList=[],e.totalPage=0)})},sizeChangeHandle:function(e){this.pageSize=e,this.pageIndex=1,this.getDataList()},currentChangeHandle:function(e){this.pageIndex=e,this.getDataList()},selectionChangeHandle:function(e){this.dataListSelections=e},configHandle:function(){var e=this;this.configVisible=!0,this.$nextTick(function(){e.$refs.config.init()})},uploadHandle:function(){var e=this;this.uploadVisible=!0,this.$nextTick(function(){e.$refs.upload.init()})},showImg:function(e){this.$alert('<img src="'+e+'" style="width: auto">',"",{dangerouslyUseHTMLString:!0,confirmButtonText:"关闭",callback:function(e){}})},deleteHandle:function(e){var t=this,a=e?[e]:this.dataListSelections.map(function(e){return e.id});this.$confirm("确定对[id="+a.join(",")+"]进行["+(e?"删除":"批量删除")+"]操作?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(function(){t.$http({url:"/sys/oss/delete",method:"post",data:a}).then(function(e){var a=e.data;a&&0===a.code&&(t.$message({message:"操作成功",type:"success",duration:1500}),t.getDataList())})}).catch(function(){})}}},n={render:function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"mod-oss"},[a("el-form",{attrs:{inline:!0,model:e.searchForm},nativeOn:{keyup:function(t){return!t.type.indexOf("key")&&e._k(t.keyCode,"enter",13,t.key,"Enter")?null:e.getDataList()}}},[a("el-form-item",[a("el-input",{attrs:{placeholder:"URL地址",clearable:""},model:{value:e.searchForm.url,callback:function(t){e.$set(e.searchForm,"url",t)},expression:"searchForm.url"}})],1),e._v(" "),a("el-form-item",[a("el-button",{on:{click:function(t){return e.getDataList()}}},[e._v("查询")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.configHandle()}}},[e._v("云存储配置")]),e._v(" "),a("el-button",{attrs:{type:"primary"},on:{click:function(t){return e.uploadHandle()}}},[e._v("上传文件")]),e._v(" "),a("el-button",{attrs:{type:"danger",disabled:e.dataListSelections.length<=0},on:{click:function(t){return e.deleteHandle()}}},[e._v("批量删除")])],1)],1),e._v(" "),a("el-table",{staticStyle:{width:"100%"},attrs:{data:e.dataList,border:""},on:{"selection-change":e.selectionChangeHandle}},[a("el-table-column",{attrs:{type:"selection","header-align":"center",align:"center",width:"50"}}),e._v(" "),a("el-table-column",{attrs:{prop:"url","header-align":"center",align:"center",label:"URL地址"}}),e._v(" "),a("el-table-column",{attrs:{prop:"createDate","header-align":"center",align:"center",width:"180",label:"创建时间"}}),e._v(" "),a("el-table-column",{attrs:{fixed:"right","header-align":"center",align:"center",width:"150",label:"操作"},scopedSlots:e._u([{key:"default",fn:function(t){return[a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.showImg(t.row.url)}}},[e._v("预览")]),e._v(" "),a("el-button",{attrs:{type:"text",size:"small"},on:{click:function(a){return e.deleteHandle(t.row.id)}}},[e._v("删除")])]}}])})],1),e._v(" "),a("el-pagination",{attrs:{"current-page":e.pageIndex,"page-sizes":[10,20,50,100],"page-size":e.pageSize,total:e.totalPage,layout:"total, sizes, prev, pager, next, jumper"},on:{"size-change":e.sizeChangeHandle,"current-change":e.currentChangeHandle}}),e._v(" "),e.configVisible?a("config",{ref:"config"}):e._e(),e._v(" "),e.uploadVisible?a("upload",{ref:"upload",on:{refreshDataList:e.getDataList}}):e._e()],1)},staticRenderFns:[]};var r=a("VU/8")(o,n,!1,function(e){a("A5ML")},null,null);t.default=r.exports},ijIH:function(e,t,a){(e.exports=a("FZ+f")(!1)).push([e.i,"\n.el-message-box {\n  width: auto;\n}\n",""])}});