var exec = require('cordova/exec');

exports.initSchema = function(schema, success, error) {
    exec(success, error, "Go2NativePlugin", "initSchema", [schema]);
};

