package com.shop.configuration;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Bucket;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.StorageClient;

@Configuration
public class FirebaseConfig {

	@Bean(name = "firebaseApp")
	public FirebaseApp getFirebaseApp() throws IOException {
		InputStream serviceAccount = this.getClass().getClassLoader()
				.getResourceAsStream("./mu-shop-6a3dc-firebase-adminsdk-uclep-7a96061e52.json");
		assert serviceAccount != null;
		FirebaseOptions options = FirebaseOptions.builder().setCredentials(GoogleCredentials.fromStream(serviceAccount))
				.setDatabaseUrl("https://mu-shop-6a3dc.firebaseapp.com/").setStorageBucket("mu-shop-6a3dc.appspot.com")
				.build();

		return FirebaseApp.initializeApp(options);
	}

	@Bean(name = "bucket")
	public Bucket getStorage() throws IOException {
		return StorageClient.getInstance(getFirebaseApp()).bucket();
	}
}
