package fr.m2i.biblioweb.jaas;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;

public class JaasCallBackHandler implements CallbackHandler {

	public JaasCallBackHandler() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
		System.out.println("connexion");

	}

}
