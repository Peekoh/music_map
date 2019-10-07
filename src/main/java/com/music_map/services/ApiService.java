package com.music_map.services;

import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionException;

import org.springframework.stereotype.Service;
//import com.music_map.services.*;
import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.model_objects.credentials.ClientCredentials;
import com.wrapper.spotify.model_objects.specification.Artist;
import com.wrapper.spotify.model_objects.specification.Paging;
import com.wrapper.spotify.requests.authorization.client_credentials.ClientCredentialsRequest;
import com.wrapper.spotify.requests.data.search.simplified.SearchArtistsRequest;

@Service
public class ApiService {
//CREATE API OBJECT
	private static final SpotifyApi spotifyApi = new SpotifyApi.Builder()
			.setClientId("23599b46f39d456f98e70fb4a8e7f8f7").setClientSecret("71506a1ee74443969d298cb089b361f3")
			.build();
	private static final ClientCredentialsRequest ccr = spotifyApi.clientCredentials()
			.build();

	public static void clientCredentials_Async() {
		try {
			final CompletableFuture<ClientCredentials> clientCredentialsFuture = ccr.executeAsync();

			// Thread free to do other tasks...

			// Example Only. Never block in production code.
			final ClientCredentials clientCredentials = clientCredentialsFuture.join();

			// Set access token for further "spotifyApi" object usage
			spotifyApi.setAccessToken(clientCredentials.getAccessToken());
			System.out.println(clientCredentials.getAccessToken());

			System.out.println("Expires in: " + clientCredentials.getExpiresIn());
		} catch (CompletionException e) {
			System.out.println("Error: " + e.getCause().getMessage());
		} catch (CancellationException e) {
			System.out.println("Async operation cancelled.");
		}
	}

	

	public Paging<Artist> searchArtist(String a) {
		final SearchArtistsRequest searchArtists = spotifyApi.searchArtists(a).build();
		final CompletableFuture<Paging<Artist>> artist = searchArtists.executeAsync();
		final Paging<Artist> artistsPage = artist.join();
		return artistsPage;

	}

}
