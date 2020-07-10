<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\RatingSystem;

class RatingSystemController extends Controller
{
    public function getRatingSystemBySort()
    {

        $getRatingSystems = RatingSystem::all();

        // Check if there is no cast
        if ($getRatingSystems->isEmpty()) {
            $getRatingSystems = null;
        }

        return response()->json(
            [
                'status' => 'success',
                'data' => [
                    'rating_systems' => $getRatingSystems,
                ]],
            200
        );

    }
}
