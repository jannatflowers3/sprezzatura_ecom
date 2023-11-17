"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[583],{9367:(t,s,a)=>{a.r(s),a.d(s,{default:()=>i});const e={name:"contact",components:{shimmer:a(4016).Z},mounted:function(){var t=this;if(t.contact||t.$store.dispatch("contactPage"),t.settings.map_api_key){var s=document.createElement("script");s.src="https://maps.googleapis.com/maps/api/js?key="+t.settings.map_api_key+"&callback=initMap&v=weekly",s.async=!0,window.initMap=function(){var s=new google.maps.Map(document.getElementById("map"),{center:{lat:23.822141,lng:90.440813},zoom:parseInt(t.settings.zoom_level)});new google.maps.Marker({position:new google.maps.LatLng(23.822141,90.440813),map:s,title:"Cryptox"})},document.head.appendChild(s)}},data:function(){return{loading:!1,form:{name:"",email:"",subject:"",message:""},map:""}},computed:{contact:function(){return this.$store.getters.getContactPage},shimmer:function(){return this.$store.state.module.shimmer}},methods:{submit:function(){var t=this;this.loading=!0;var s=this.getUrl("send-message");axios.post(s,this.form).then((function(s){t.loading=!1,s.data.success?(toastr.success(t.lang.message_sent_successfully,t.lang.Success+" !!"),t.errors=[],t.form.email="",t.form.name="",t.form.subject="",t.form.message=""):s.data.error&&toastr.error(s.data.error,t.lang.Error+" !!")})).catch((function(s){t.loading=!1,422==s.response.status&&(t.errors=s.response.data.errors)}))}}};const i=(0,a(1900).Z)(e,(function(){var t=this,s=t._self._c;return s("div",{staticClass:"sg-page-content"},[s("section",{staticClass:"contact-section"},[s("div",{staticClass:"container"},[s("div",{staticClass:"page-title"},[s("h1",[t._v(t._s(t.contact.title))])]),t._v(" "),s("div",{staticClass:"contact-content"},[s("div",{staticClass:"row"},[s("div",{staticClass:"col-md-6"},[s("div",{staticClass:"title b-0"},[s("h1",[t._v(t._s(t.lang.send_message))])]),t._v(" "),s("form",{on:{submit:function(s){return s.preventDefault(),t.submit.apply(null,arguments)}}},[s("div",{staticClass:"form-group"},[s("label",[t._v(t._s(t.lang.name))]),t._v(" "),s("input",{directives:[{name:"model",rawName:"v-model",value:t.form.name,expression:"form.name"}],staticClass:"form-control",class:{error_border:t.errors.name},attrs:{type:"text",placeholder:t.lang.name},domProps:{value:t.form.name},on:{input:function(s){s.target.composing||t.$set(t.form,"name",s.target.value)}}})]),t._v(" "),t.errors.name?s("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.name[0]))]):t._e(),t._v(" "),s("div",{staticClass:"form-group"},[s("label",[t._v(t._s(t.lang.email))]),t._v(" "),s("input",{directives:[{name:"model",rawName:"v-model",value:t.form.email,expression:"form.email"}],staticClass:"form-control",class:{error_border:t.errors.email},attrs:{type:"email",placeholder:t.lang.email},domProps:{value:t.form.email},on:{input:function(s){s.target.composing||t.$set(t.form,"email",s.target.value)}}})]),t._v(" "),t.errors.email?s("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.email[0]))]):t._e(),t._v(" "),s("div",{staticClass:"form-group"},[s("label",[t._v(t._s(t.lang.subject))]),t._v(" "),s("input",{directives:[{name:"model",rawName:"v-model",value:t.form.subject,expression:"form.subject"}],staticClass:"form-control",class:{error_border:t.errors.subject},attrs:{type:"text",placeholder:t.lang.subject},domProps:{value:t.form.subject},on:{input:function(s){s.target.composing||t.$set(t.form,"subject",s.target.value)}}})]),t._v(" "),t.errors.subject?s("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.subject[0]))]):t._e(),t._v(" "),s("div",{staticClass:"form-group"},[s("label",[t._v(t._s(t.lang.message))]),t._v(" "),s("textarea",{directives:[{name:"model",rawName:"v-model",value:t.form.message,expression:"form.message"}],staticClass:"form-control",class:{error_border:t.errors.message},attrs:{placeholder:t.lang.write_your_message},domProps:{value:t.form.message},on:{input:function(s){s.target.composing||t.$set(t.form,"message",s.target.value)}}})]),t._v(" "),t.errors.message?s("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.message[0]))]):t._e(),t._v(" "),s("div",[t.loading?s("loading_button",{attrs:{class_name:"btn btn-primary"}}):s("button",{staticClass:"btn btn-primary",attrs:{type:"submit"}},[t._v("\n                    "+t._s(t.lang.send)+"\n                  ")])],1)])]),t._v(" "),s("div",{staticClass:"col-md-6"},[s("div",{staticClass:"contact-info"},[s("div",{staticClass:"title b-0"},[s("h1",[t._v(t._s(t.lang.reach_on_us))])]),t._v(" "),s("div",{staticClass:"contact-list"},[s("ul",{staticClass:"global-list"},[t.contact.address?s("li",[s("span",{staticClass:"mdi mdi-name mdi-map-marker"}),t._v(t._s(t.contact.address)+"\n                  ")]):t._e(),t._v(" "),t.contact.phone||t.contact.optional_phone?s("li",[s("span",{staticClass:"mdi mdi-name mdi-phone"}),t._v(" "),s("a",{attrs:{href:"tel:"+t.contact.phone}},[t._v(t._s(t.contact.phone))]),t._v(" "),s("a",{attrs:{href:"tel:"+t.contact.optional_phone}},[t._v(t._s(t.contact.optional_phone))])]):t._e(),t._v(" "),t.contact.email||t.contact.optional_email?s("li",[s("span",{staticClass:"mdi mdi-name mdi-email"}),t._v(" "),s("a",{attrs:{href:"mailto:"+t.contact.email}},[t._v(t._s(t.contact.email))]),t._v(" "),s("a",{attrs:{href:"mailto:"+t.contact.optional_email}},[t._v(t._s(t.contact.optional_email))])]):t._e()])]),t._v(" "),t.settings.show_social_links&&1==t.settings.show_social_links?s("div",{staticClass:"social"},[s("div",{staticClass:"title b-0 mb-0"},[s("h1",[t._v(t._s(t.lang.follow_us))])]),t._v(" "),s("ul",{staticClass:"global-list"},[t.settings.facebook_link?s("li",[s("a",{attrs:{href:t.settings.facebook_link}},[s("span",{staticClass:"mdi mdi-name mdi-facebook"})])]):t._e(),t._v(" "),t.settings.twitter_link?s("li",[s("a",{attrs:{href:t.settings.twitter_link}},[s("span",{staticClass:"mdi mdi-name mdi-twitter"})])]):t._e(),t._v(" "),t.settings.linkedin_link?s("li",[s("a",{attrs:{href:t.settings.linkedin_link}},[s("span",{staticClass:"mdi mdi-linkedin"})])]):t._e(),t._v(" "),t.settings.instagram_link?s("li",[s("a",{attrs:{href:t.settings.instagram_link}},[s("span",{staticClass:"mdi mdi-instagram"})])]):t._e(),t._v(" "),t.settings.youtube_link?s("li",[s("a",{attrs:{href:t.settings.youtube_link}},[s("span",{staticClass:"mdi mdi-youtube"})])]):t._e()])]):t._e(),t._v(" "),s("div",{staticClass:"map",staticStyle:{height:"250px"},attrs:{id:"map"}})])])])])])])])}),[],!1,null,null,null).exports},4016:(t,s,a)=>{a.d(s,{Z:()=>i});const e={name:"shimmer.vue",props:["height"],data:function(){return{style:{height:this.height+"px"}}}};const i=(0,a(1900).Z)(e,(function(){var t=this;return(0,t._self._c)("img",{staticClass:"shimmer",style:[t.height?t.style:null],attrs:{src:t.getUrl("public/images/default/preview.jpg"),alt:"shimmer"}})}),[],!1,null,null,null).exports}}]);