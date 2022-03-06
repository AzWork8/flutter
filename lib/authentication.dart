import 'package:flutter/material.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

var _username = ["username1"];
var _password = ["password123"];
int _i = 1;

class Authentication {
  bool fetchCredentials(String username, String password) {
    for (var j = 0; j < _username.length; j++) {
      if (username == '' && password == '') {
        return true;
      } else if (username == _username[j] && password == _password[j]) {
        return true;
      }
    }

    return false;
  }
}
