Movies App - Homework 6

An app that gets movies from the TMDB API and shows them in a grid. When you tap a movie it opens another screen with more details about it.

Screenshots
| Home | Details |
|---|---|
| ![Home](<img width="400" height="780" alt="Screenshot 2026-09-03 at 3 31 36 PM" src="https://github.com/user-attachments/assets/d5ce64ec-9e52-49e6-b82c-0f4adc9b89d0" />
) | ![Details](<img width="401" height="781" alt="Screenshot 2026-09-03 at 3 31 51 PM" src="https://github.com/user-attachments/assets/a40e05a1-75c0-4ca8-97e2-fa9846790622" />
) |

The API
I used TMDB (themoviedb.org) instead of the meals one. You need to make an account and get a free API key.

I ended up using two endpoints:
movie/popular for the grid
movie/{id} for the details screen

The fields I used are id, title, poster_path, vote_average, overview, release_date and runtime.

One thing that confused me at the start is that poster_path is not a real link, it's just something like /abc123.jpg. So I made a getter in the model that puts the base url in front of it:

"https://image.tmdb.org/t/p/w500$posterPath"


Widgets
FutureBuilder to wait for the data and show a spinner while it loads
GridView.builder for the 2 columns
GestureDetector to make the tiles tappable
Image.network with an errorBuilder, some posters don't load so it shows an icon instead
Navigator.push to open the details screen, I passed the whole Movie object not just the fields

Package
Only http, installed with flutter pub add http.

To run it
Add your own TMDB key in lib/services/api.dart then flutter pub get and run.
