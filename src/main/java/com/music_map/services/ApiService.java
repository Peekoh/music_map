package com.music_map.services;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionException;

import org.springframework.stereotype.Service;

import com.music_map.models.History;
import com.music_map.models.Review;
import com.music_map.models.User;
import com.neovisionaries.i18n.CountryCode;
//import com.music_map.services.*;
import com.wrapper.spotify.SpotifyApi;
import com.wrapper.spotify.exceptions.SpotifyWebApiException;
import com.wrapper.spotify.model_objects.credentials.ClientCredentials;
import com.wrapper.spotify.model_objects.specification.AlbumSimplified;
import com.wrapper.spotify.model_objects.specification.Artist;
import com.wrapper.spotify.model_objects.specification.Paging;
import com.wrapper.spotify.requests.authorization.client_credentials.ClientCredentialsRequest;
import com.wrapper.spotify.requests.data.artists.GetArtistRequest;
import com.wrapper.spotify.requests.data.artists.GetArtistsRelatedArtistsRequest;
import com.wrapper.spotify.requests.data.search.simplified.SearchAlbumsRequest;
import com.wrapper.spotify.requests.data.search.simplified.SearchArtistsRequest;
import com.wrapper.spotify.requests.data.search.simplified.SearchArtistsRequest.Builder;

@Service
public class ApiService {

	// private final ReviewRepository reviewRepo;

	// CREATE API OBJECT
	private static final SpotifyApi spotifyApi = new SpotifyApi.Builder()
			.setClientId("23599b46f39d456f98e70fb4a8e7f8f7").setClientSecret("71506a1ee74443969d298cb089b361f3")
			.build();
	private static final ClientCredentialsRequest ccr = spotifyApi.clientCredentials().build();

	/* GET API ACCESS */
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

	// SEARCH ARTISTS
	public Paging<Artist> searchArtist(String a) {
		final SearchArtistsRequest searchArtists = spotifyApi.searchArtists(a).build();
		final CompletableFuture<Paging<Artist>> artist = searchArtists.executeAsync();
		final Paging<Artist> artistsPage = artist.join();
		return artistsPage;
	}

	// GET SPECIFIC ARTIST
	public Artist findArtistById(String id) {
		final GetArtistRequest getArtistRequest = spotifyApi.getArtist(id).build();
		try {
			final Artist artist = getArtistRequest.execute();
			return artist;
		} catch (IOException | SpotifyWebApiException e) {
			System.out.println("ERROR: " + e.getMessage());
		}
		return null;
	}

	// GET ALBUMS OF ARTIST
	public Paging<AlbumSimplified> findAlbums(String id) {
		// get artist
		GetArtistRequest getArtistRequest = spotifyApi.getArtist(id).build();
		try {
			Artist artist = getArtistRequest.execute();

			// get albums
			final SearchAlbumsRequest searchAlbumsRequest = spotifyApi.searchAlbums((String) artist.getName())
					.market(CountryCode.US).build();
			try {
				Paging<AlbumSimplified> albums = searchAlbumsRequest.execute();
				return albums;
			} catch (IOException | SpotifyWebApiException e) {}
		} catch (IOException | SpotifyWebApiException e) {
		}
		return null;

	}

	// GET RELATED ARTIST
	public Artist[] findRelated(String id) {
		final GetArtistsRelatedArtistsRequest getRelated = spotifyApi.getArtistsRelatedArtists(id).build();
		try {
			final Artist[] artists = getRelated.execute();
			// Artist[] limitedArtists = artists;
			Artist[] limited = new Artist[10];
			for (int i = 0; i < 10; i++) {
				limited[i] = artists[i];
			}
			return limited;
		} catch (IOException | SpotifyWebApiException e) {
			System.out.println("ERROR: " + e.getMessage());
			return null;
		}
	}

	// GET ARTISTS OF REVIEWS
	public List<Artist> findReviewArtists(List<Review> r) {
		List<Artist> reviewedArtists = new ArrayList<>();
		for (int i = 0; i < r.size(); i++) {
			String artistId = r.get(i).getArtistId();
			final GetArtistRequest getArtistRequest = spotifyApi.getArtist(artistId).build();
			try {
				final Artist artist = getArtistRequest.execute();
				reviewedArtists.add(artist);
			} catch (IOException | SpotifyWebApiException e) {
				System.out.println("ERROR: " + e.getMessage());
			}
		}
		return reviewedArtists;
	}

	// GRAB ARTIST HISTORY FROM API

	public List<Artist> getHistory(User u) {
		List<History> hl = u.getHistory();
		Collections.reverse(hl);
		List<Artist> al = new ArrayList<>();
		if (hl.size() <= 5) {
			for (int i = 0; i < hl.size(); i++) {
				String id = hl.get(i).getArtistId();
				final GetArtistRequest getArtistRequest = spotifyApi.getArtist(id).build();
				try {
					final Artist artist = getArtistRequest.execute();
					al.add(artist);

				} catch (IOException | SpotifyWebApiException e) {
				}
			}
		} else {
			for (int i = 0; i < 5; i++) {
				String id = hl.get(i).getArtistId();
				final GetArtistRequest getArtistRequest = spotifyApi.getArtist(id).build();
				try {
					final Artist artist = getArtistRequest.execute();
					al.add(artist);
				} catch (IOException | SpotifyWebApiException e) {
				}
			}
		}
		return al;
	}

}
