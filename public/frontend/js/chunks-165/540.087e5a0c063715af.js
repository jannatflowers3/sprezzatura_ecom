"use strict";(self.webpackChunk=self.webpackChunk||[]).push([[540],{8540:(t,e,s)=>{s.r(e),s.d(e,{default:()=>r});s(4016);const a={name:"affiliate_program",data:function(){return{activeClass:"",skip:1,show_load_more:!0,active:0,loading:!1,page:1,activeNav:"products",product_next_page_url:!1,brand_next_page_url:!1,shop_next_page_url:!1,url:"",fetched_campaign:"",checkListing:!0,is_shimmer:!1}},computed:{baseUrl:function(){return this.$store.getters.getBaseUrl},shimmer:function(){return this.$store.state.module.shimmer}},methods:{campaignProducts:function(){var t=this,e={slug:this.$route.params.slug};this.activeNav="products";var s=this.baseUrl+"/home/campaign-products";if(this.lengthCounter(this.products)>0){this.product_next_page_url=this.products.next_page_url;var a=this.$store.getters.getCampaignStore.filter((function(e){return e.slug==t.$route.params.slug}));return a&&(this.fetched_campaign=a[0]),this.products}axios.get(s,{params:e}).then((function(e){e.data.error&&toastr.error(e.data.error,t.lang.Error+" !!"),t.fetched_campaign=e.data.campaign,t.$store.commit("setCampaignStore",e.data.campaign),t.product_next_page_url=e.data.products.next_page_url;var s={slug:t.$route.params.slug,products:e.data.products};t.$store.commit("getCampaignProducts",s)}))}}};const r=(0,s(1900).Z)(a,(function(){var t=this,e=t._self._c;return e("div",{staticClass:"sg-page-content"},[e("section",{staticClass:"sg-breadcumb-section",style:"background-image: url("+t.settings.affiliate_program_banner+")"},[t._m(0)]),t._v(" "),e("section",{staticClass:"about-section"},[e("div",{staticClass:"container text-center display-4 mt-4"},[e("router-link",{attrs:{to:{name:"affiliate.register"}}},[t._v("\n          "+t._s(t.lang.sign_up)+"\n        ")]),t._v(" "),t._m(1),t._v(" "),e("div",{domProps:{innerHTML:t._s(t.settings.affiliate_terms_condition)}})],1)])])}),[function(){var t=this._self._c;return t("div",{staticClass:"container"},[t("div",{staticClass:"breadcumb-content"})])},function(){var t=this._self._c;return t("div",{staticClass:"page-title mt-4"},[t("h1",[this._v("Affiliate Agreement")])])}],!1,null,null,null).exports},4016:(t,e,s)=>{s.d(e,{Z:()=>r});const a={name:"shimmer.vue",props:["height"],data:function(){return{style:{height:this.height+"px"}}}};const r=(0,s(1900).Z)(a,(function(){var t=this;return(0,t._self._c)("img",{staticClass:"shimmer",style:[t.height?t.style:null],attrs:{src:t.getUrl("public/images/default/preview.jpg"),alt:"shimmer"}})}),[],!1,null,null,null).exports}}]);