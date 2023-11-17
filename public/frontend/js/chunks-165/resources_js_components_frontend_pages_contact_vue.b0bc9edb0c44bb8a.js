"use strict";
(self["webpackChunk"] = self["webpackChunk"] || []).push([["resources_js_components_frontend_pages_contact_vue"],{

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/contact.vue?vue&type=script&lang=js":
/*!****************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/contact.vue?vue&type=script&lang=js ***!
  \****************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _partials_shimmer__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../partials/shimmer */ "./resources/js/components/frontend/partials/shimmer.vue");

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "contact",
  components: {
    shimmer: _partials_shimmer__WEBPACK_IMPORTED_MODULE_0__["default"]
  },
  mounted: function mounted() {
    var that = this;
    if (!that.contact) {
      that.$store.dispatch('contactPage');
    }
    if (that.settings.map_api_key) {
      var script = document.createElement('script');
      script.src = 'https://maps.googleapis.com/maps/api/js?key=' + that.settings.map_api_key + '&callback=initMap&v=weekly';
      script.async = true;
      window.initMap = function () {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {
            lat: 23.822141,
            lng: 90.440813
          },
          zoom: parseInt(that.settings.zoom_level)
        });
        new google.maps.Marker({
          position: new google.maps.LatLng(23.822141, 90.440813),
          map: map,
          title: 'Cryptox'
        });
      };
      document.head.appendChild(script);
    }
  },
  data: function data() {
    return {
      loading: false,
      form: {
        name: "",
        email: "",
        subject: "",
        message: ""
      },
      map: ''
    };
  },
  computed: {
    contact: function contact() {
      return this.$store.getters.getContactPage;
    },
    shimmer: function shimmer() {
      return this.$store.state.module.shimmer;
    }
  },
  methods: {
    submit: function submit() {
      var _this = this;
      this.loading = true;
      var url = this.getUrl('send-message');
      axios.post(url, this.form).then(function (response) {
        _this.loading = false;
        if (response.data.success) {
          toastr.success(_this.lang.message_sent_successfully, _this.lang.Success + ' !!');
          _this.errors = [];
          _this.form.email = '';
          _this.form.name = '';
          _this.form.subject = '';
          _this.form.message = '';
        } else {
          if (response.data.error) {
            toastr.error(response.data.error, _this.lang.Error + ' !!');
          }
        }
      })["catch"](function (error) {
        _this.loading = false;
        if (error.response.status == 422) {
          _this.errors = error.response.data.errors;
        }
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js":
/*!*******************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js ***!
  \*******************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "shimmer.vue",
  props: ['height'],
  data: function data() {
    return {
      style: {
        height: this.height + 'px'
      }
    };
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/contact.vue?vue&type=template&id=a5e250ba":
/*!***************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/contact.vue?vue&type=template&id=a5e250ba ***!
  \***************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _c("div", {
    staticClass: "sg-page-content"
  }, [_c("section", {
    staticClass: "contact-section"
  }, [_c("div", {
    staticClass: "container"
  }, [_c("div", {
    staticClass: "page-title"
  }, [_c("h1", [_vm._v(_vm._s(_vm.contact.title))])]), _vm._v(" "), _c("div", {
    staticClass: "contact-content"
  }, [_c("div", {
    staticClass: "row"
  }, [_c("div", {
    staticClass: "col-md-6"
  }, [_c("div", {
    staticClass: "title b-0"
  }, [_c("h1", [_vm._v(_vm._s(_vm.lang.send_message))])]), _vm._v(" "), _c("form", {
    on: {
      submit: function submit($event) {
        $event.preventDefault();
        return _vm.submit.apply(null, arguments);
      }
    }
  }, [_c("div", {
    staticClass: "form-group"
  }, [_c("label", [_vm._v(_vm._s(_vm.lang.name))]), _vm._v(" "), _c("input", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.form.name,
      expression: "form.name"
    }],
    staticClass: "form-control",
    "class": {
      error_border: _vm.errors.name
    },
    attrs: {
      type: "text",
      placeholder: _vm.lang.name
    },
    domProps: {
      value: _vm.form.name
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.form, "name", $event.target.value);
      }
    }
  })]), _vm._v(" "), _vm.errors.name ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.name[0]))]) : _vm._e(), _vm._v(" "), _c("div", {
    staticClass: "form-group"
  }, [_c("label", [_vm._v(_vm._s(_vm.lang.email))]), _vm._v(" "), _c("input", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.form.email,
      expression: "form.email"
    }],
    staticClass: "form-control",
    "class": {
      error_border: _vm.errors.email
    },
    attrs: {
      type: "email",
      placeholder: _vm.lang.email
    },
    domProps: {
      value: _vm.form.email
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.form, "email", $event.target.value);
      }
    }
  })]), _vm._v(" "), _vm.errors.email ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.email[0]))]) : _vm._e(), _vm._v(" "), _c("div", {
    staticClass: "form-group"
  }, [_c("label", [_vm._v(_vm._s(_vm.lang.subject))]), _vm._v(" "), _c("input", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.form.subject,
      expression: "form.subject"
    }],
    staticClass: "form-control",
    "class": {
      error_border: _vm.errors.subject
    },
    attrs: {
      type: "text",
      placeholder: _vm.lang.subject
    },
    domProps: {
      value: _vm.form.subject
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.form, "subject", $event.target.value);
      }
    }
  })]), _vm._v(" "), _vm.errors.subject ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.subject[0]))]) : _vm._e(), _vm._v(" "), _c("div", {
    staticClass: "form-group"
  }, [_c("label", [_vm._v(_vm._s(_vm.lang.message))]), _vm._v(" "), _c("textarea", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.form.message,
      expression: "form.message"
    }],
    staticClass: "form-control",
    "class": {
      error_border: _vm.errors.message
    },
    attrs: {
      placeholder: _vm.lang.write_your_message
    },
    domProps: {
      value: _vm.form.message
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.form, "message", $event.target.value);
      }
    }
  })]), _vm._v(" "), _vm.errors.message ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.message[0]))]) : _vm._e(), _vm._v(" "), _c("div", [_vm.loading ? _c("loading_button", {
    attrs: {
      class_name: "btn btn-primary"
    }
  }) : _c("button", {
    staticClass: "btn btn-primary",
    attrs: {
      type: "submit"
    }
  }, [_vm._v("\n                    " + _vm._s(_vm.lang.send) + "\n                  ")])], 1)])]), _vm._v(" "), _c("div", {
    staticClass: "col-md-6"
  }, [_c("div", {
    staticClass: "contact-info"
  }, [_c("div", {
    staticClass: "title b-0"
  }, [_c("h1", [_vm._v(_vm._s(_vm.lang.reach_on_us))])]), _vm._v(" "), _c("div", {
    staticClass: "contact-list"
  }, [_c("ul", {
    staticClass: "global-list"
  }, [_vm.contact.address ? _c("li", [_c("span", {
    staticClass: "mdi mdi-name mdi-map-marker"
  }), _vm._v(_vm._s(_vm.contact.address) + "\n                  ")]) : _vm._e(), _vm._v(" "), _vm.contact.phone || _vm.contact.optional_phone ? _c("li", [_c("span", {
    staticClass: "mdi mdi-name mdi-phone"
  }), _vm._v(" "), _c("a", {
    attrs: {
      href: "tel:" + _vm.contact.phone
    }
  }, [_vm._v(_vm._s(_vm.contact.phone))]), _vm._v(" "), _c("a", {
    attrs: {
      href: "tel:" + _vm.contact.optional_phone
    }
  }, [_vm._v(_vm._s(_vm.contact.optional_phone))])]) : _vm._e(), _vm._v(" "), _vm.contact.email || _vm.contact.optional_email ? _c("li", [_c("span", {
    staticClass: "mdi mdi-name mdi-email"
  }), _vm._v(" "), _c("a", {
    attrs: {
      href: "mailto:" + _vm.contact.email
    }
  }, [_vm._v(_vm._s(_vm.contact.email))]), _vm._v(" "), _c("a", {
    attrs: {
      href: "mailto:" + _vm.contact.optional_email
    }
  }, [_vm._v(_vm._s(_vm.contact.optional_email))])]) : _vm._e()])]), _vm._v(" "), _vm.settings.show_social_links && _vm.settings.show_social_links == 1 ? _c("div", {
    staticClass: "social"
  }, [_c("div", {
    staticClass: "title b-0 mb-0"
  }, [_c("h1", [_vm._v(_vm._s(_vm.lang.follow_us))])]), _vm._v(" "), _c("ul", {
    staticClass: "global-list"
  }, [_vm.settings.facebook_link ? _c("li", [_c("a", {
    attrs: {
      href: _vm.settings.facebook_link
    }
  }, [_c("span", {
    staticClass: "mdi mdi-name mdi-facebook"
  })])]) : _vm._e(), _vm._v(" "), _vm.settings.twitter_link ? _c("li", [_c("a", {
    attrs: {
      href: _vm.settings.twitter_link
    }
  }, [_c("span", {
    staticClass: "mdi mdi-name mdi-twitter"
  })])]) : _vm._e(), _vm._v(" "), _vm.settings.linkedin_link ? _c("li", [_c("a", {
    attrs: {
      href: _vm.settings.linkedin_link
    }
  }, [_c("span", {
    staticClass: "mdi mdi-linkedin"
  })])]) : _vm._e(), _vm._v(" "), _vm.settings.instagram_link ? _c("li", [_c("a", {
    attrs: {
      href: _vm.settings.instagram_link
    }
  }, [_c("span", {
    staticClass: "mdi mdi-instagram"
  })])]) : _vm._e(), _vm._v(" "), _vm.settings.youtube_link ? _c("li", [_c("a", {
    attrs: {
      href: _vm.settings.youtube_link
    }
  }, [_c("span", {
    staticClass: "mdi mdi-youtube"
  })])]) : _vm._e()])]) : _vm._e(), _vm._v(" "), _c("div", {
    staticClass: "map",
    staticStyle: {
      height: "250px"
    },
    attrs: {
      id: "map"
    }
  })])])])])])])]);
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926":
/*!******************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926 ***!
  \******************************************************************************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* binding */ render),
/* harmony export */   staticRenderFns: () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function render() {
  var _vm = this,
    _c = _vm._self._c;
  return _c("img", {
    staticClass: "shimmer",
    style: [_vm.height ? _vm.style : null],
    attrs: {
      src: _vm.getUrl("public/images/default/preview.jpg"),
      alt: "shimmer"
    }
  });
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./resources/js/components/frontend/pages/contact.vue":
/*!************************************************************!*\
  !*** ./resources/js/components/frontend/pages/contact.vue ***!
  \************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _contact_vue_vue_type_template_id_a5e250ba__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./contact.vue?vue&type=template&id=a5e250ba */ "./resources/js/components/frontend/pages/contact.vue?vue&type=template&id=a5e250ba");
/* harmony import */ var _contact_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./contact.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/contact.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _contact_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _contact_vue_vue_type_template_id_a5e250ba__WEBPACK_IMPORTED_MODULE_0__.render,
  _contact_vue_vue_type_template_id_a5e250ba__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/contact.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/partials/shimmer.vue":
/*!***************************************************************!*\
  !*** ./resources/js/components/frontend/partials/shimmer.vue ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./shimmer.vue?vue&type=template&id=44ada926 */ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926");
/* harmony import */ var _shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./shimmer.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.render,
  _shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/partials/shimmer.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/pages/contact.vue?vue&type=script&lang=js":
/*!************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/contact.vue?vue&type=script&lang=js ***!
  \************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_contact_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./contact.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/contact.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_contact_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js":
/*!***************************************************************************************!*\
  !*** ./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js ***!
  \***************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./shimmer.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/pages/contact.vue?vue&type=template&id=a5e250ba":
/*!******************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/contact.vue?vue&type=template&id=a5e250ba ***!
  \******************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_contact_vue_vue_type_template_id_a5e250ba__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_contact_vue_vue_type_template_id_a5e250ba__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_contact_vue_vue_type_template_id_a5e250ba__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./contact.vue?vue&type=template&id=a5e250ba */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/contact.vue?vue&type=template&id=a5e250ba");


/***/ }),

/***/ "./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926":
/*!*********************************************************************************************!*\
  !*** ./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926 ***!
  \*********************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_shimmer_vue_vue_type_template_id_44ada926__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./shimmer.vue?vue&type=template&id=44ada926 */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/partials/shimmer.vue?vue&type=template&id=44ada926");


/***/ })

}]);