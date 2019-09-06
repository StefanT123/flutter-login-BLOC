import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
    final _emailController = StreamController<String>();
    final _passwordController = StreamController<String>();

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

final bloc = Bloc();
