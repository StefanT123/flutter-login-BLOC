import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators {
    final _emailController = BehaviorSubject<String>();
    final _passwordController = BehaviorSubject<String>();

    /**
     * Add data to stream.
     */
    Function(String) get changeEmail => _emailController.sink.add;
    Function(String) get changePassword => _passwordController.sink.add;

    /**
     * Retireve data from stream.
     */
    Stream<String> get email => _emailController.stream.transform(validateEmail);
    Stream<String> get password => _passwordController.stream.transform(validatePassword);
    Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true);

    submit() {
        final validEmail = this._emailController.value;
        final validPassword = this._passwordController.value;

        print('Email is ${validEmail}');
        print('Password is ${validPassword}');
    }

    /**
     * Close the stream.
     *
     * @return {void}
     */
    void dispose() {
        _emailController.close();
        _passwordController.close();
    }
}
