"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[196],{1196:(t,e,s)=>{s.r(e),s.d(e,{default:()=>n});var a=s(5888),r=s(7765);const o={name:"migrate-to-seller",data:function(){return{current:"migrate_to_seller",loading:!1,form:{first_name:"",last_name:"",email:"",password:"",shop_name:"",phone:"",address:"",phone_no:"",user_type:"seller-migrate",tax_paper:"",logo:"",banner:""}}},components:{user_sidebar:a.Z,telePhone:r.Z},methods:{register:function(){var t=this,e=this.getUrl("user/user-to-seller");if(!confirm("Are you sure, You want to be Seller?"))return!1;this.loading=!0,axios.post(e,this.form,{transformRequest:[function(t,e){return objectToFormData(t)}]}).then((function(e){t.loading=!1,e.data.error?toastr.error(e.data.error,t.lang.Error+" !!"):(toastr.success(e.data.migrate_msg,t.lang.Success+" !!"),t.$store.dispatch("user",null),t.$router.push({name:"home"}),t.$Progress.finish())})).catch((function(e){t.loading=!1,422==e.response.status&&(t.errors=e.response.data.errors)}))},taxUp:function(t){this.form.tax_paper=t.target.files[0],this.$refs.taxUpload.innerHTML=this.form.tax_paper.name},logoUp:function(t){this.form.logo=t.target.files[0],this.$refs.logoUpload.innerHTML=this.form.logo.name},bannerUp:function(t){this.form.banner=t.target.files[0],this.$refs.bannerUpload.innerHTML=this.form.banner.name},getNumber:function(t){this.form.phone_no=t}}};const n=(0,s(1900).Z)(o,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"sg-page-content"},[e("section",{staticClass:"edit-profile"},[e("div",{staticClass:"container"},[e("div",{staticClass:"row"},[e("user_sidebar",{attrs:{current:t.current}}),t._v(" "),e("div",{staticClass:"col-lg-9"},[e("div",{staticClass:"edit-profile-box"},[e("div",{staticClass:"title justify-content-between"},[e("h1",[t._v(t._s(t.lang.shop_information))])]),t._v(" "),e("form",{on:{submit:function(e){return e.preventDefault(),t.register.apply(null,arguments)}}},[e("div",{staticClass:"sg-card"},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-md-12"},[e("div",{staticClass:"form-group"},[e("label",{attrs:{for:"name"}},[t._v(t._s(t.lang.shop_name))]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.form.shop_name,expression:"form.shop_name"}],staticClass:"form-control",class:{error_border:t.errors.shop_name},attrs:{type:"text",id:"name",placeholder:"Enter Your Shop Name"},domProps:{value:t.form.shop_name},on:{input:function(e){e.target.composing||t.$set(t.form,"shop_name",e.target.value)}}})]),t._v(" "),t.errors.shop_name?e("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.shop_name[0]))]):t._e()]),t._v(" "),e("div",{staticClass:"col-md-12"},[e("div",{staticClass:"form-group"},[e("label",{attrs:{for:"address"}},[t._v(t._s(t.lang.shop_address))]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.form.address,expression:"form.address"}],staticClass:"form-control",class:{error_border:t.errors.address},attrs:{type:"text",id:"address",placeholder:t.lang.enter_your_shop_address},domProps:{value:t.form.address},on:{input:function(e){e.target.composing||t.$set(t.form,"address",e.target.value)}}})]),t._v(" "),t.errors.address?e("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.address[0]))]):t._e()]),t._v(" "),e("div",{staticClass:"col-md-12"},[e("div",{class:{"mb-4":!t.errors.phone_no}},[e("label",[t._v(t._s(t.lang.phone))]),t._v(" "),e("telePhone",{on:{phone_no:t.getNumber}})],1),t._v(" "),t.errors.phone_no?e("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.phone_no[0]))]):t._e()]),t._v(" "),e("div",{staticClass:"col-lg-12"},[e("div",{staticClass:"form-group"},[e("label",{attrs:{for:"address"}},[t._v(t._s(t.lang.license_no))]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.form.license_no,expression:"form.license_no"}],staticClass:"form-control",class:{error_border:t.errors.license_no},attrs:{type:"text",id:"license_no",placeholder:"Enter Your License No"},domProps:{value:t.form.license_no},on:{input:function(e){e.target.composing||t.$set(t.form,"license_no",e.target.value)}}})]),t._v(" "),t.errors.license_no?e("span",{staticClass:"validation_error"},[t._v(t._s(t.errors.license_no[0]))]):t._e()]),t._v(" "),e("div",{staticClass:"col-lg-12"},[e("div",{staticClass:"form-group"},[e("label",[t._v(t._s(t.lang.tax_paper))]),t._v(" "),e("div",{staticClass:"input-group"},[e("div",{staticClass:"custom-file d-flex"},[e("label",{staticClass:"upload-image form-control",attrs:{for:"tax_paper1"}},[e("input",{class:{error_border:t.errors.logo},attrs:{type:"file",id:"tax_paper1"},on:{change:function(e){return t.taxUp(e)}}}),t._v(" "),e("i",{ref:"taxUpload"},[t._v(t._s(t.product_form.image_text))])]),t._v(" "),e("label",{staticClass:"upload-image upload-text d-flex",attrs:{for:"tax_paper2"}},[e("input",{attrs:{type:"file",id:"tax_paper2"},on:{change:function(e){return t.taxUp(e)}}}),t._v(" "),e("img",{staticClass:"img-fluid",attrs:{loading:"lazy",src:t.getUrl("public/images/others/env.svg")}}),t._v("\n                                                        "+t._s(t.lang.upload)+"\n                                                    ")])])])])]),t._v(" "),e("div",{staticClass:"col-lg-12"},[e("div",{staticClass:"form-group"},[e("label",[t._v(t._s(t.lang.logo))]),t._v(" "),e("div",{staticClass:"input-group"},[e("div",{staticClass:"custom-file d-flex"},[e("label",{staticClass:"upload-image form-control",attrs:{for:"logo"}},[e("input",{class:{error_border:t.errors.banner},attrs:{type:"file",id:"logo"},on:{change:function(e){return t.logoUp(e)}}}),t._v(" "),e("i",{ref:"logoUpload"},[t._v(t._s(t.product_form.image_text))])]),t._v(" "),e("label",{staticClass:"upload-image upload-text d-flex",attrs:{for:"logo-2"}},[e("input",{attrs:{type:"file",id:"logo-2"},on:{change:function(e){return t.logoUp(e)}}}),t._v(" "),e("img",{staticClass:"img-fluid",attrs:{loading:"lazy",src:t.getUrl("public/images/others/env.svg"),alt:"file up icon"}}),t._v("\n                                                        "+t._s(t.lang.upload)+"\n                                                    ")])])])])]),t._v(" "),e("div",{staticClass:"col-lg-12"},[e("div",{staticClass:"form-group"},[e("label",[t._v(t._s(t.lang.banner))]),t._v(" "),e("div",{staticClass:"input-group"},[e("div",{staticClass:"custom-file d-flex"},[e("label",{staticClass:"upload-image form-control",attrs:{for:"banner"}},[e("input",{attrs:{type:"file",id:"banner"},on:{change:function(e){return t.bannerUp(e)}}}),t._v(" "),e("i",{ref:"bannerUpload"},[t._v(t._s(t.product_form.image_text))])]),t._v(" "),e("label",{staticClass:"upload-image upload-text d-flex",attrs:{for:"banner-2"}},[e("input",{attrs:{type:"file",id:"banner-2"},on:{change:function(e){return t.bannerUp(e)}}}),t._v(" "),e("img",{staticClass:"img-fluid",attrs:{loading:"lazy",src:t.getUrl("public/images/others/env.svg"),alt:"file up icon"}}),t._v("\n                                                        "+t._s(t.lang.upload)+"\n                                                    ")])])])])]),t._v(" "),e("div",{staticClass:"col-lg-12 mt-2"},[e("div",{staticClass:"form-button"},[t.loading?e("loading_button",{attrs:{class_name:"btn btn-primary"}}):e("button",{staticClass:"btn btn-primary"},[t._v(t._s(t.lang.update))])],1)])])])])])])],1)])])])}),[],!1,null,null,null).exports},4016:(t,e,s)=>{s.d(e,{Z:()=>r});const a={name:"shimmer.vue",props:["height"],data:function(){return{style:{height:this.height+"px"}}}};const r=(0,s(1900).Z)(a,(function(){var t=this;return(0,t._self._c)("img",{staticClass:"shimmer",style:[t.height?t.style:null],attrs:{src:t.getUrl("public/images/default/preview.jpg"),alt:"shimmer"}})}),[],!1,null,null,null).exports},7765:(t,e,s)=>{s.d(e,{Z:()=>r});const a={name:"telephone",props:["phone_error"],data:function(){return{dropdown_active:!1,search_key:"",selected_country:"",defaultCountry:{flag:"",code:"",name:""},activeClass:"hideShow",phone_no:"",count:1,filtered_countries:[],country_id:[]}},watch:{phone:function(){this.phone_no=this.phone}},mounted:function(){this.country(),this.country_id=this.settings.default_country},computed:{phone:function(){return this.$store.getters.getMobileNo},countries:function(){return this.$store.getters.getCountryList}},methods:{PlusCheck:function(t){return!!t&&t.phonecode.includes("+")},getCountryCode:function(t){this.activeClass="hideShow",this.phone_no="",this.count=1,this.defaultCountry.flag=t?t.flag_icon:this.getUrl("public/images/flags/bd.png");t?(this.country_id=t.id,t.phonecode.includes("+")?this.defaultCountry.code=t.phonecode:this.defaultCountry.code="+"+t.phonecode,this.defaultCountry.name=t.name):(this.defaultCountry.code="+880",this.defaultCountry.name="Bangladesh"),this.phone_no=this.defaultCountry.code},activeDropDown:function(){var t=this;"hideShow"==this.activeClass?this.activeClass="":this.activeClass="hideShow",this.$nextTick((function(){document.addEventListener("click",t.hideSearchDropdown)}))},hideSearchDropdown:function(){this.activeClass="hideShow",document.removeEventListener("click",this.hideSearchDropdown)},countrySearch:function(){var t,e=this;return t=this.countries.filter((function(t){return t.name||t.phonecode})),this.filtered_countries=t.filter((function(t){return t.name&&t.name.toLowerCase().includes(e.search_key)||t.phonecode.includes(e.search_key)})),this.filtered_countries},getNum:function(){this.$emit("phone_no",this.phone_no),this.count++},country:function(){var t=this,e=this.getUrl("get/country-list");if(this.countries.length>0){this.filtered_countries=this.countries;var s=this.countries.find((function(e){return e.id==t.settings.default_country}));this.getCountryCode(s)}else axios.get(e).then((function(e){if(e.data.error)toastr.error(e.data.error,t.lang.Error+" !!");else{t.$store.commit("setCountryList",e.data.countries),t.filtered_countries=e.data.countries;var s=t.countries.find((function(e){return e.id==t.settings.default_country}));t.getCountryCode(s)}}))}}};const r=(0,s(1900).Z)(a,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"yoori__signup--form",class:{error_border:t.phone_error}},[e("div",{staticClass:"country__code--config",on:{click:function(e){return e.stopPropagation(),t.activeDropDown.apply(null,arguments)}}},[e("div",{staticClass:"country__code--config-details"},[e("span",{staticClass:"country__code--flag"},[e("img",{staticClass:"img-fluid",attrs:{src:t.defaultCountry.flag,alt:"Flag"}})]),t._v(" "),e("span",{staticClass:"country__dropdown"})]),t._v(" "),e("ul",{staticClass:"country__code--list",class:t.activeClass,on:{click:function(t){t.stopPropagation()}}},[e("input",{directives:[{name:"model",rawName:"v-model",value:t.search_key,expression:"search_key"}],staticClass:"country__search",attrs:{placeholder:"Search",type:"text"},domProps:{value:t.search_key},on:{keyup:t.countrySearch,input:function(e){e.target.composing||(t.search_key=e.target.value)}}}),t._v(" "),t._l(t.filtered_countries,(function(s,a){return e("li",{on:{click:function(e){return t.getCountryCode(s)}}},[e("span",{staticClass:"country__code--flag"},[e("img",{staticClass:"img-fluid",attrs:{loading:"lazy",src:s.flag_icon,alt:"Flag"}})]),t._v(" "),e("span",{staticClass:"country__name"},[e("strong",[t._v(t._s(s.name))])]),t._v(" "),e("span",{staticClass:"country__code--number"},[t._v("\n                        "+t._s(t.PlusCheck(s)?s.phonecode:"+"+s.phonecode)+"\n                      ")])])}))],2)]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.phone_no,expression:"phone_no"}],staticClass:"number",attrs:{type:"tel"},domProps:{value:t.phone_no},on:{keyup:function(e){return t.$emit("phone_no",t.phone_no)},input:function(e){e.target.composing||(t.phone_no=e.target.value)}}}),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.country_id,expression:"country_id"}],attrs:{type:"hidden"},domProps:{value:t.country_id},on:{input:function(e){e.target.composing||(t.country_id=e.target.value)}}})])}),[],!1,null,"6c1c69d2",null).exports},5888:(t,e,s)=>{s.d(e,{Z:()=>r});const a={name:"user_sidebar",props:["current","addresses"],data:function(){return{loading:!1,download_url:!1,show_menu:""}},mounted:function(){this.checkAuth()},computed:{totalReward:function(){return this.$store.getters.getTotalReward},modalType:function(){return this.$store.getters.getModalType}},components:{shimmer:s(4016).Z},methods:{checkAuth:function(){var t=this,e=this.getUrl("home/check-auth");axios.get(e).then((function(e){t.$store.dispatch("user",e.data.user),t.$store.commit("getOrderUrl",e.data.order_urls),t.authUser?"admin"==t.authUser.user_type&&t.$router.push({name:"home"}):t.$router.push({name:"login"}),e.data.reward&&t.$store.commit("setTotalReward",e.data.reward),e.data.download_urls&&(t.download_url=!0)}))},convertReward:function(){var t=this,e=this.getUrl("user/convert-reward"),s={amount:this.converted_reward/this.settings.reward_convert_rate,reward:this.converted_reward};s.amount>0&&this.totalReward.rewards>=this.converted_reward&&confirm("Are You Sure! You want to Convert ?")&&(this.loading=!0,axios.post(e,s).then((function(e){t.loading=!1,e.data.error?toastr.error(e.data.error,t.lang.Error+" !!"):(toastr.success(e.data.success,t.lang.Success+"!!"),$("#convert_reward").modal("hide"),t.converted_reward="",t.$store.dispatch("user",e.data.user),t.$store.commit("setTotalReward",e.data.reward))})).catch((function(e){t.loading=!1})))},showMenu:function(){"displayMenu"==this.show_menu?this.show_menu="":this.show_menu="displayMenu"}}};const r=(0,s(1900).Z)(a,(function(){var t=this,e=t._self._c;return t.authUser?e("div",{staticClass:"col-lg-3"},[e("div",{staticClass:"profile-details position-relative"},[e("div",{staticClass:"profile-thumb"},[e("img",{staticClass:"img-fluid",attrs:{src:t.authUser.profile_image,alt:t.authUser.full_name}})]),t._v(" "),e("h2",[t._v(t._s(t.authUser.full_name)+" "),e("router-link",{staticClass:"d-inline",attrs:{to:{name:"edit.profile"}}},[e("span",{staticClass:"mdi mdi-name mdi-pencil"})])],1),t._v(" "),e("a",{attrs:{href:"javascript:void(0)"}},[t._v(t._s(t.authUser.email))]),t._v(" "),t.addons.includes("ramdhani")||1!=t.settings.seller_system?t._e():e("router-link",{staticClass:"be_seller base",attrs:{to:{name:"migrate.seller"}}},[t._v("\n                "+t._s(t.lang.be_a_seller)+" "),e("span",{staticClass:"mdi mdi-name mdi-store-outline"})])],1),t._v(" "),e("div",{staticClass:"sidebar-menu"},[e("ul",{staticClass:"global-list"},[e("li",{class:{active:"dashboard"===t.current}},[e("router-link",{attrs:{to:{name:"dashboard"}}},[e("span",{staticClass:"mdi mdi-name mdi-view-dashboard-outline"}),t._v(" "+t._s(t.lang.dashboard)+"\n                    ")])],1),t._v(" "),e("li",{class:{active:"addresses"===t.current}},[e("router-link",{attrs:{to:{name:"addresses"}}},[e("span",{staticClass:"mdi mdi-name mdi-map-marker-outline"}),t._v("\n                        "+t._s(t.lang.addresses)+"\n                    ")])],1),t._v(" "),e("li",{class:{active:"notification"===t.current}},[e("router-link",{attrs:{to:{name:"notification"}}},[e("span",{staticClass:"mdi mdi-name mdi-bell-outline"}),t._v("\n                        "+t._s(t.lang.notification)+"\n                    ")])],1),t._v(" "),e("li",{class:{active:"order_history"===t.current}},[e("router-link",{attrs:{to:{name:"order.history"}}},[e("span",{staticClass:"mdi mdi-name mdi-cart-outline"}),t._v("\n                        "+t._s(t.lang.order_history)+"\n                    ")])],1),t._v(" "),t.download_url?e("li",{class:{active:"digital_product_order_history"===t.current}},[e("router-link",{attrs:{to:{name:"orders.digital.product"}}},[e("span",{staticClass:"mdi mdi-name mdi-cart-arrow-down"}),t._v(" "+t._s(t.lang.digital_product_order)+"\n                    ")])],1):t._e(),t._v(" "),1==t.settings.coupon_system?e("li",{class:{active:"gift_voucher"===t.current}},[e("router-link",{attrs:{to:{name:"gift.voucher"}}},[e("span",{staticClass:"mdi mdi-name mdi-wallet-giftcard"}),t._v("\n                        "+t._s(t.lang.gift_voucher)+"\n                    ")])],1):t._e(),t._v(" "),e("li",{class:{active:"change_password"===t.current}},[e("router-link",{attrs:{to:{name:"change.password"}}},[e("span",{staticClass:"mdi mdi-name mdi-lock-outline"}),t._v("\n                        "+t._s(t.lang.change_password)+"\n                    ")])],1),t._v(" "),1==t.settings.wallet_system?e("li",{class:{active:"wallet_history"===t.current}},[e("router-link",{attrs:{to:{name:"wallet.history"}}},[e("span",{staticClass:"mdi mdi-wallet-outline"}),t._v("\n                        "+t._s(t.lang.my_wallet)+"\n                    ")])],1):t._e(),t._v(" "),t.addons.includes("reward")?e("li",{class:{active:"reward_history"===t.current}},[e("router-link",{attrs:{to:{name:"reward.history"}}},[e("span",{staticClass:"mdi mdi-vector-point"}),t._v(t._s(t.lang.my_rewards)+"\n                    ")])],1):t._e(),t._v(" "),t.addons.includes("affiliate")&&t.authUser.referral_code?e("li",{staticClass:"dp-arrow",class:{active:"affiliate_system"===t.current,displayMenu:"displayMenu"===t.show_menu},on:{click:t.showMenu}},[t._m(0),t._v(" "),e("ul",{staticClass:"dashboard-dp-menu"},[e("li",[e("router-link",{attrs:{to:{name:"affiliate.system"}}},[t._v("Affiliate System")])],1),t._v(" "),e("li",[e("router-link",{attrs:{to:"/sdfsfd"}},[t._v("iewww1")])],1)])]):t._e(),t._v(" "),1==t.settings.seller_system?e("li",{class:{active:"followed_shop"===t.current}},[e("router-link",{attrs:{to:{name:"shop.followed"}}},[e("span",{staticClass:"mdi mdi-home-heart"}),t._v(t._s(t.lang.shop)+"\n                    ")])],1):t._e()])]),t._v(" "),e("div",{staticClass:"modal fade reward",attrs:{id:"convert_reward",tabindex:"-1","aria-labelledby":"exampleModalLabel","aria-hidden":"true"}},[e("div",{staticClass:"modal-dialog modal-md modal-dialog-centered modal-dialog-scrollable"},[e("div",{staticClass:"modal-content"},[e("div",{staticClass:"modal-header"},[e("h5",{staticClass:"modal-title"},[t._v(t._s(t.lang.reward_point))]),t._v(" "),t._m(1)]),t._v(" "),e("div",{staticClass:"modal-body reward_modal"},[e("form",{on:{submit:function(e){return e.preventDefault(),t.convertReward.apply(null,arguments)}}},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-lg-12 text-center"},[e("div",{staticClass:"form-group"},[e("label",{attrs:{for:"reward"}},[t._v(t._s(t.lang.reward_point)+" ")]),t._v(" "),e("input",{directives:[{name:"model",rawName:"v-model",value:t.converted_reward,expression:"converted_reward"}],staticClass:"form-control",attrs:{type:"text",id:"reward",placeholder:t.lang.enter_point_you_want_convert},domProps:{value:t.converted_reward},on:{input:function(e){e.target.composing||(t.converted_reward=e.target.value)}}})]),t._v(" "),null!=t.totalReward?e("div",{staticClass:"text-start"},[e("p",[t._v("Available Points to Convert : "+t._s(t.totalReward.rewards))]),t._v(" "),e("p",[t._v(t._s(t.settings.reward_convert_rate)+t._s(t.lang.reward_points)+t._s(t.priceFormat(1)))]),t._v(" "),t.totalReward.rewards>0?e("p",[t._v(t._s(t.lang.total_amount_you_will_get)+"\n                                            "+t._s(t.priceFormat(t.converted_reward/t.settings.reward_convert_rate)))]):t._e()]):t._e(),t._v(" "),t.loading?e("loading_button",{attrs:{class_name:"btn btn-primary mt-3"}}):e("button",{staticClass:"btn btn-primary mt-3",class:{disable_btn:t.converted_reward<t.settings.reward_convert_rate||t.totalReward.rewards<t.converted_reward},attrs:{type:"submit"}},[t._v("\n                                        "+t._s(t.lang.covert_rewards)+"\n                                    ")])],1)])])])])])])]):t._e()}),[function(){var t=this._self._c;return t("a",{attrs:{href:"javascript:void(0)"}},[t("span",{staticClass:"mdi mdi-vector-point"}),this._v("Affiliate\n                ")])},function(){var t=this._self._c;return t("button",{staticClass:"close modal_close",attrs:{type:"button","data-bs-dismiss":"modal","aria-label":"Close"}},[t("span",{attrs:{"aria-hidden":"true"}},[this._v("×")])])}],!1,null,null,null).exports}}]);