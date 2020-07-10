<?php

namespace App\Http\Controllers\Admin;

use App\Genres;
use App\Http\Controllers\Controller;

class GenresController extends Controller
{
    public function getGenresBySort()
    {

        $getGenres = Genres::all();

        // Check if there is no cast
        if ($getGenres->isEmpty()) {
            $getGenres = null;
        }

        return response()->json(
            [
                'status' => 'success',
                'data' => [
                    'genres' => $getGenres,
                ]],
            200
        );

    }
}
