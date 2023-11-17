"use strict";
(self["webpackChunk"] = self["webpackChunk"] || []).push([["resources_js_components_frontend_pages_forgot-password_vue"],{

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/forgot-password.vue?vue&type=script&lang=js":
/*!************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/forgot-password.vue?vue&type=script&lang=js ***!
  \************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: "forgot_password",
  components: {},
  data: function data() {
    return {
      form: {
        email: this.$route.params.email,
        newPassword: "",
        confirmPassword: "",
        resetCode: this.$route.params.code
      },
      loading: false
    };
  },
  methods: {
    submit: function submit() {
      var _this = this;
      this.loading = true;
      var url = this.getUrl('reset-password');
      axios.post(url, this.form).then(function (response) {
        _this.loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this.lang.Error + ' !!');
        }
        if (response.data.success) {
          _this.errors = [];
          _this.form.email = "";
          toastr.success(response.data.success, _this.lang.Success + ' !!');
        }
      })["catch"](function (error) {
        _this.loading = false;
        if (error.response && error.response.status == 422) {
          _this.errors = error.response.data.errors;
        }
      });
    },
    createPassword: function createPassword() {
      var _this2 = this;
      var url = this.getUrl('create-new-password');
      this.loading = true;
      axios.post(url, this.form).then(function (response) {
        _this2.loading = false;
        if (response.data.error) {
          toastr.error(response.data.error, _this2.lang.Error + ' !!');
        }
        if (response.data.success) {
          _this2.errors = [];
          toastr.success(response.data.success, _this2.lang.Success + ' !!');
          _this2.$router.push({
            name: 'login'
          });
        }
      })["catch"](function (error) {
        _this2.loading = false;
        if (error.response.status == 422) {
          _this2.errors = error.response.data.errors;
        }
      });
    }
  }
});

/***/ }),

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/forgot-password.vue?vue&type=template&id=d75d5ff0":
/*!***********************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/forgot-password.vue?vue&type=template&id=d75d5ff0 ***!
  \***********************************************************************************************************************************************************************************************************************************************************************************************************/
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
    staticClass: "ragister-account text-center"
  }, [_c("div", {
    staticClass: "container"
  }, [_c("div", {
    staticClass: "account-content"
  }, [_c("div", {
    staticClass: "thumb"
  }, [_c("img", {
    staticClass: "img-fluid",
    attrs: {
      src: _vm.settings.forgot_password_banner,
      alt: "forgot_password"
    }
  })]), _vm._v(" "), _c("div", {
    staticClass: "form-content"
  }, [_c("h1", [_vm._v(_vm._s(_vm.lang.fORGOT_pASSWORD))]), _vm._v(" "), _vm.form.resetCode == null ? _c("p", [_vm._v(_vm._s(_vm.lang.enter_email_recover_your_password))]) : _vm._e(), _vm._v(" "), _vm.form.resetCode != null ? _c("p", [_vm._v(_vm._s(_vm.lang.enter_your_new_password))]) : _vm._e(), _vm._v(" "), _c("form", {
    staticClass: "ragister-form",
    attrs: {
      name: "ragister-form"
    },
    on: {
      submit: function submit($event) {
        $event.preventDefault();
      }
    }
  }, [_vm.form.resetCode == null ? _c("div", {
    staticClass: "form-group"
  }, [_c("span", {
    staticClass: "mdi mdi-name mdi-email-outline"
  }), _vm._v(" "), _c("input", {
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
  })]) : _vm._e(), _vm._v(" "), _vm.errors.email ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.email[0]))]) : _vm._e(), _vm._v(" "), _vm.form.resetCode != null ? _c("div", {
    staticClass: "form-group"
  }, [_c("span", {
    staticClass: "mdi mdi-name mdi-lock-outline"
  }), _vm._v(" "), _c("input", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.form.newPassword,
      expression: "form.newPassword"
    }],
    staticClass: "form-control",
    "class": {
      error_border: _vm.errors.newPassword
    },
    attrs: {
      type: "password",
      placeholder: _vm.lang.new_password
    },
    domProps: {
      value: _vm.form.newPassword
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.form, "newPassword", $event.target.value);
      }
    }
  })]) : _vm._e(), _vm._v(" "), _vm.errors.newPassword ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.newPassword[0]))]) : _vm._e(), _vm._v(" "), _vm.form.resetCode != null ? _c("div", {
    staticClass: "form-group"
  }, [_c("span", {
    staticClass: "mdi mdi-name mdi-lock-outline"
  }), _vm._v(" "), _c("input", {
    directives: [{
      name: "model",
      rawName: "v-model",
      value: _vm.form.confirmPassword,
      expression: "form.confirmPassword"
    }],
    staticClass: "form-control",
    "class": {
      error_border: _vm.errors.confirmPassword
    },
    attrs: {
      type: "password",
      placeholder: _vm.lang.confirm_password
    },
    domProps: {
      value: _vm.form.confirmPassword
    },
    on: {
      input: function input($event) {
        if ($event.target.composing) return;
        _vm.$set(_vm.form, "confirmPassword", $event.target.value);
      }
    }
  })]) : _vm._e(), _vm._v(" "), _vm.errors.confirmPassword ? _c("span", {
    staticClass: "validation_error"
  }, [_vm._v(_vm._s(_vm.errors.confirmPassword[0]))]) : _vm._e(), _vm._v(" "), !_vm.form.resetCode && !_vm.loading ? _c("button", {
    staticClass: "btn",
    "class": {
      disable_btn: this.loading
    },
    attrs: {
      type: "submit"
    },
    on: {
      click: _vm.submit
    }
  }, [_vm._v(_vm._s(_vm.lang.send))]) : _vm._e(), _vm._v(" "), _vm.loading ? _c("loading_button", {
    attrs: {
      class_name: "btn"
    }
  }) : _vm._e(), _vm._v(" "), _vm.form.resetCode && !_vm.loading ? _c("button", {
    staticClass: "btn",
    attrs: {
      type: "submit"
    },
    on: {
      click: function click($event) {
        $event.preventDefault();
        return _vm.createPassword.apply(null, arguments);
      }
    }
  }, [_vm._v(_vm._s(_vm.lang.create_new_password))]) : _vm._e(), _vm._v(" "), _c("p", [_vm._v("Back to "), _c("router-link", {
    attrs: {
      to: {
        name: "login"
      }
    }
  }, [_vm._v("Sign in")])], 1)], 1)])])])])]);
};
var staticRenderFns = [];
render._withStripped = true;


/***/ }),

/***/ "./resources/js/components/frontend/pages/forgot-password.vue":
/*!********************************************************************!*\
  !*** ./resources/js/components/frontend/pages/forgot-password.vue ***!
  \********************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _forgot_password_vue_vue_type_template_id_d75d5ff0__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./forgot-password.vue?vue&type=template&id=d75d5ff0 */ "./resources/js/components/frontend/pages/forgot-password.vue?vue&type=template&id=d75d5ff0");
/* harmony import */ var _forgot_password_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./forgot-password.vue?vue&type=script&lang=js */ "./resources/js/components/frontend/pages/forgot-password.vue?vue&type=script&lang=js");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _forgot_password_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_1__["default"],
  _forgot_password_vue_vue_type_template_id_d75d5ff0__WEBPACK_IMPORTED_MODULE_0__.render,
  _forgot_password_vue_vue_type_template_id_d75d5ff0__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/components/frontend/pages/forgot-password.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/components/frontend/pages/forgot-password.vue?vue&type=script&lang=js":
/*!********************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/forgot-password.vue?vue&type=script&lang=js ***!
  \********************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_forgot_password_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./forgot-password.vue?vue&type=script&lang=js */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/forgot-password.vue?vue&type=script&lang=js");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_forgot_password_vue_vue_type_script_lang_js__WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/components/frontend/pages/forgot-password.vue?vue&type=template&id=d75d5ff0":
/*!**************************************************************************************************!*\
  !*** ./resources/js/components/frontend/pages/forgot-password.vue?vue&type=template&id=d75d5ff0 ***!
  \**************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   render: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_forgot_password_vue_vue_type_template_id_d75d5ff0__WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   staticRenderFns: () => (/* reexport safe */ _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_forgot_password_vue_vue_type_template_id_d75d5ff0__WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_use_0_node_modules_vue_loader_lib_loaders_templateLoader_js_ruleSet_1_rules_2_node_modules_vue_loader_lib_index_js_vue_loader_options_forgot_password_vue_vue_type_template_id_d75d5ff0__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./forgot-password.vue?vue&type=template&id=d75d5ff0 */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5.use[0]!./node_modules/vue-loader/lib/loaders/templateLoader.js??ruleSet[1].rules[2]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/components/frontend/pages/forgot-password.vue?vue&type=template&id=d75d5ff0");


/***/ })

}]);