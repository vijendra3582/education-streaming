<template>
<div class="xjkax">

    <div class="loader-discover" v-if="loading">
        <loader></loader>
    </div>

    <collection-modal @hideModalCollectionCancel="HIDE_COLLECTION_MODAL_CANCEL" @hideModalCollectionSave="HIDE_COLLECTION_MODAL_SAVE" :id="collection.id" :poster="collection.poster" :name="collection.name" :type="collection.type" :index="collection.index"></collection-modal>

    <!-- END Collection compone    nt -->

    <div v-if="data.data !== null">

        <div class="top-item" v-if="data.top !== null">
            <carousel class="list-carousel" navigationPrevLabel='<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 129 129" enable-background="new 0 0 129 129" width="100%" class="arrow-right-svg"><g><g>
                                                            <path d="m88.6,121.3c0.8,0.8 1.8,1.2 2.9,1.2s2.1-0.4 2.9-1.2c1.6-1.6 1.6-4.2 0-5.8l-51-51 51-51c1.6-1.6 1.6-4.2 0-5.8s-4.2-1.6-5.8,0l-54,53.9c-1.6,1.6-1.6,4.2 0,5.8l54,53.9z" data-original="#000000" class="active-path" data-old_color="#ffffff" fill="#ffffff"/>
                                                          </g></g> </svg>' navigationNextLabel='<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 129 129" enable-background="new 0 0 129 129" width="100%" class="arrow-left-svg"><g transform="matrix(-1 1.22465e-16 -1.22465e-16 -1 129 129)"><g>
                                                            <path d="m88.6,121.3c0.8,0.8 1.8,1.2 2.9,1.2s2.1-0.4 2.9-1.2c1.6-1.6 1.6-4.2 0-5.8l-51-51 51-51c1.6-1.6 1.6-4.2 0-5.8s-4.2-1.6-5.8,0l-54,53.9c-1.6,1.6-1.6,4.2 0,5.8l54,53.9z" data-original="#000000" class="active-path" data-old_color="#ffffff" fill="#ffffff"/>
                                                          </g></g> </svg>' :navigationEnabled="true" :paginationEnabled="false" :autoplay="true" :autoplayTimeout="5000" easing="ease-in-out" :perPageCustom="[[220,1], [420,1],[768, 1], [1024, 1]]">
                <slide v-for="(item,index) in data.top" :key="index">

                    <div class="top-item__film-cover" v-if="item.type === 'movie'">
                        <div class="gradient"></div>
                        <img :src="'/storage/backdrops/original_' + item.backdrop" :alt="item.name" width="100%" class="backdrop" v-if="item.cloud == 'local' ">
                        <img :src=" lg_backdrop + item.backdrop" :alt="item.name" width="100%" class="backdrop" v-if="item.cloud == 'aws' ">
                        <router-link :to="{name: 'show-movie', params:{id: item.id}}">
                            <div class="top-item__film-ovarlay">

                                <div class="top-item__film-details">

                                    <!-- <div class="hidden-sm-down poster">
                                        <img :src="'/storage/posters/300_' + item.poster" :alt="item.name" class="poster" v-if="item.cloud == 'local'">
                                        <img :src=" sm_poster + item.poster" :alt="item.name" class="poster" v-if="item.cloud == 'aws'">
                                        </div> -->

                                        <div class="title">
                                            <h2>
                                                <strong>{{item.name}}</strong>
                                            </h2>
                                            <small>{{item.genre}}</small>
                                        </div>
                                        <div class="overview">
                                            <p>{{ item.overview | truncate(110, item.overview )}}</p>
                                        </div>

                                        <div class="control">
                                            <div class="btn-group">

                                                <router-link role="button" class="btn btn-sm btn-warning" :to="{name: 'movie-player', params: {id: item.id}}">
                                                    {{$t('home.play')}}

                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 191.255 191.255"
                                                        style="enable-background:new 0 0 191.255 191.255;" xml:space="preserve"
                                                        width="100%" class="top-play-svg">
                                                        <g>
                                                            <path d="M162.929,66.612c-2.814-1.754-6.514-0.896-8.267,1.917s-0.895,6.513,1.917,8.266c6.544,4.081,10.45,11.121,10.45,18.833  s-3.906,14.752-10.45,18.833l-98.417,61.365c-6.943,4.329-15.359,4.542-22.512,0.573c-7.154-3.97-11.425-11.225-11.425-19.406  V34.262c0-8.181,4.271-15.436,11.425-19.406c7.153-3.969,15.569-3.756,22.512,0.573l57.292,35.723  c2.813,1.752,6.513,0.895,8.267-1.917c1.753-2.812,0.895-6.513-1.917-8.266L64.512,5.247c-10.696-6.669-23.661-7-34.685-0.883  C18.806,10.48,12.226,21.657,12.226,34.262v122.73c0,12.605,6.58,23.782,17.602,29.898c5.25,2.913,10.939,4.364,16.616,4.364  c6.241,0,12.467-1.754,18.068-5.247l98.417-61.365c10.082-6.287,16.101-17.133,16.101-29.015S173.011,72.899,162.929,66.612z"
                                                                data-original="#000000" class="active-path" data-old_color="#ffffff"
                                                                fill="#ffffff" />
                                                        </g>
                                                    </svg>

                                                </router-link>

                                                <button class="btn btn-sm btn-plus btn-circle btn-success ml-1"
                                                        v-if="! item.is_favorite"
                                                        @click.prevent="SHOW_COLLECTION_MODAL(item.id, '/storage/backdrops/600_' + item.backdrop, item.name, 'movie', null, index)">
                                                    {{$t('home.my_list')}}

                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" class="top-collection-svg"
                                                        x="0px" y="0px" viewBox="0 0 31.444 31.444" style="enable-background:new 0 0 31.444 31.444;"
                                                        xml:space="preserve" width="100%">
                                                        <g>
                                                            <path d="M1.119,16.841c-0.619,0-1.111-0.508-1.111-1.127c0-0.619,0.492-1.111,1.111-1.111h13.475V1.127  C14.595,0.508,15.103,0,15.722,0c0.619,0,1.111,0.508,1.111,1.127v13.476h13.475c0.619,0,1.127,0.492,1.127,1.111  c0,0.619-0.508,1.127-1.127,1.127H16.833v13.476c0,0.619-0.492,1.127-1.111,1.127c-0.619,0-1.127-0.508-1.127-1.127V16.841H1.119z"
                                                                data-original="#ffffff" class="active-path" data-old_color="#ffffff"
                                                                fill="#ffffff" />
                                                        </g>
                                                    </svg>

                                                </button>

                                                <button class="btn btn-sm btn-plus btn-circle btn-danger ml-1"
                                                        v-if="item.is_favorite"
                                                        @click.prevent="DELETE_FROM_COLLECTION(item.id, 'movie', null, index)">
                                                    {{$t('home.my_list')}}

                                                    <svg version="1.1" class="top-collection-svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                        x="0px" y="0px" viewBox="0 0 511.999 511.999" width="100%" style="enable-background:new 0 0 511.999 511.999;"
                                                        xml:space="preserve">
                                                        <g>
                                                            <g>
                                                                <path d="M506.231,75.508c-7.689-7.69-20.158-7.69-27.849,0l-319.21,319.211L33.617,269.163c-7.689-7.691-20.158-7.691-27.849,0
                                                                                        c-7.69,7.69-7.69,20.158,0,27.849l139.481,139.481c7.687,7.687,20.16,7.689,27.849,0l333.133-333.136
                                                                                        C513.921,95.666,513.921,83.198,506.231,75.508z"
                                                                    fill="#ffffff" />
                                                            </g>
                                                        </g>

                                                    </svg>

                                                </button>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                        </router-link>

                    </div>

                    <!-- END Top Movie -->

                    <div class="top-item__film-cover" v-if="item.type === 'series'">
                        <div class="gradient"></div>
                        <img :src="'/storage/backdrops/original_' + item.backdrop" :alt="item.name" width="100%" v-if="item.cloud == 'local' ">
                        <img :src=" lg_backdrop + item.backdrop" :alt="item.name" width="100%"  v-if="item.cloud == 'aws' ">
                        <router-link :to="{name: 'show-series', params:{id: item.id}}">
                            <div class="top-item__film-ovarlay">

                                <div class="top-item__film-details">
                                    <div class="hidden-sm-down poster">
                                        <img :src="'/storage/posters/300_' + item.poster" :alt="item.name" class="poster" v-if="item.cloud == 'local'">
                                        <img :src=" sm_poster + item.poster" :alt="item.name" class="poster" v-if="item.cloud == 'aws'">
                                        </div>

                                        <div class="title">
                                            <h2>
                                                <strong>{{item.name}}</strong>
                                            </h2>
                                            <small>{{item.genre}}</small>
                                        </div>
                                        <div class="overview">
                                            <p>{{ item.overview | truncate(110, item.overview )}}</p>
                                        </div>

                                        <div class="control">
                                            <div class="btn-group">

                                                <router-link role="button" class="btn btn-sm btn-warning" :to="{name: 'series-player', params: {series_id: item.id}}">
                                                    {{$t('home.play')}}

                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 191.255 191.255"
                                                        style="enable-background:new 0 0 191.255 191.255;" xml:space="preserve"
                                                        width="100%" class="top-play-svg">
                                                        <g>
                                                            <path d="M162.929,66.612c-2.814-1.754-6.514-0.896-8.267,1.917s-0.895,6.513,1.917,8.266c6.544,4.081,10.45,11.121,10.45,18.833  s-3.906,14.752-10.45,18.833l-98.417,61.365c-6.943,4.329-15.359,4.542-22.512,0.573c-7.154-3.97-11.425-11.225-11.425-19.406  V34.262c0-8.181,4.271-15.436,11.425-19.406c7.153-3.969,15.569-3.756,22.512,0.573l57.292,35.723  c2.813,1.752,6.513,0.895,8.267-1.917c1.753-2.812,0.895-6.513-1.917-8.266L64.512,5.247c-10.696-6.669-23.661-7-34.685-0.883  C18.806,10.48,12.226,21.657,12.226,34.262v122.73c0,12.605,6.58,23.782,17.602,29.898c5.25,2.913,10.939,4.364,16.616,4.364  c6.241,0,12.467-1.754,18.068-5.247l98.417-61.365c10.082-6.287,16.101-17.133,16.101-29.015S173.011,72.899,162.929,66.612z"
                                                                data-original="#000000" class="active-path" data-old_color="#ffffff"
                                                                fill="#ffffff" />
                                                        </g>
                                                    </svg>

                                                </router-link>


                                                <button class="btn btn-sm btn-plus btn-circle btn-success ml-1"
                                                        v-if="! item.is_favorite"
                                                        @click.prevent="SHOW_COLLECTION_MODAL(item.id, '/storage/backdrops/600_' + item.backdrop, item.name, 'movie', null, index)">
                                                    {{$t('home.my_list')}}

                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" class="top-collection-svg"
                                                        x="0px" y="0px" viewBox="0 0 31.444 31.444" style="enable-background:new 0 0 31.444 31.444;"
                                                        xml:space="preserve" width="100%">
                                                        <g>
                                                            <path d="M1.119,16.841c-0.619,0-1.111-0.508-1.111-1.127c0-0.619,0.492-1.111,1.111-1.111h13.475V1.127  C14.595,0.508,15.103,0,15.722,0c0.619,0,1.111,0.508,1.111,1.127v13.476h13.475c0.619,0,1.127,0.492,1.127,1.111  c0,0.619-0.508,1.127-1.127,1.127H16.833v13.476c0,0.619-0.492,1.127-1.111,1.127c-0.619,0-1.127-0.508-1.127-1.127V16.841H1.119z"
                                                                data-original="#ffffff" class="active-path" data-old_color="#ffffff"
                                                                fill="#ffffff" />
                                                        </g>
                                                    </svg>

                                                </button>

                                                <button class="btn btn-sm btn-plus btn-circle btn-danger ml-1"
                                                        v-if="item.is_favorite"
                                                        @click.prevent="DELETE_FROM_COLLECTION(item.id, 'movie', null, index)">
                                                    {{$t('home.my_list')}}

                                                    <svg version="1.1" class="top-collection-svg" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                                        x="0px" y="0px" viewBox="0 0 511.999 511.999" width="100%" style="enable-background:new 0 0 511.999 511.999;"
                                                        xml:space="preserve">
                                                        <g>
                                                            <g>
                                                                <path d="M506.231,75.508c-7.689-7.69-20.158-7.69-27.849,0l-319.21,319.211L33.617,269.163c-7.689-7.691-20.158-7.691-27.849,0
                                                                                        c-7.69,7.69-7.69,20.158,0,27.849l139.481,139.481c7.687,7.687,20.16,7.689,27.849,0l333.133-333.136
                                                                                        C513.921,95.666,513.921,83.198,506.231,75.508z"
                                                                    fill="#ffffff" />
                                                            </g>
                                                        </g>

                                                    </svg>

                                                </button>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                        </router-link>

                    </div>

                    <!-- END Top Series -->

                </slide>
            </carousel>

        </div>

        <!-- END TOP -->

        <div class="col-12 discover-page">
            <div class="col-12">
                <div class="row" style="margin: -30px; overflow: hidden;">
                    <div class="col-12 p-0">
                        <div class="recenlty m-3" v-if="data.recenlty !== null && $auth.isAuthenticated() === 'active' ">
                            <div class="ml-2">

                                <h3>
                                    <strong>{{$t('home.recenlty_watched')}}</strong>
                                </h3>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-4 col-lg-3 col-xl-2 m-2 mt-3 mb-5 ml-md-4 animation" v-for="(item, index) in data.recenlty" :key="index">

                                    <div class="poster" @mouseover="ACTIVE_SLELECTED_MOVIE(item.id )" v-if="item.type === 'movie'">

                                        <router-link :to="{name: 'show-movie', params: {id: item.id}}">
                                            <div class="poster__backdrop-image">

                                                <progressive-img :src="'/storage/backdrops/600_' + item.backdrop" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" v-if="item.cloud == 'local' " />

                                                <progressive-img :src="md_poster + item.backdrop" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" v-if="item.cloud == 'aws' " />

                                                <div class="poster__backdrop_overlay-info" v-if="active_movie === item.id">

                                                    <div class="body text-center">

                                                        <div class="play">

                                                            <router-link :to="{name: 'movie-player', params: {id: item.id}}">

                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px"
                                                                                viewBox="0 0 294.843 294.843" style="enable-background:new 0 0 294.843 294.843;"
                                                                                xml:space="preserve" width="100%" class="play-svg">
                                                                                <g>
                                                                                    <g>
                                                                                        <path d="M278.527,79.946c-10.324-20.023-25.38-37.704-43.538-51.132c-2.665-1.97-6.421-1.407-8.392,1.257s-1.407,6.421,1.257,8.392   c16.687,12.34,30.521,28.586,40.008,46.983c9.94,19.277,14.98,40.128,14.98,61.976c0,74.671-60.75,135.421-135.421,135.421   S12,222.093,12,147.421S72.75,12,147.421,12c3.313,0,6-2.687,6-6s-2.687-6-6-6C66.133,0,0,66.133,0,147.421   s66.133,147.421,147.421,147.421s147.421-66.133,147.421-147.421C294.842,123.977,289.201,100.645,278.527,79.946z"
                                                                                            data-original="#000000" class="active-path"
                                                                                            data-old_color="#ffffff" fill="#ffffff"
                                                                                        />
                                                                                        <path d="M109.699,78.969c-1.876,1.067-3.035,3.059-3.035,5.216v131.674c0,3.314,2.687,6,6,6s6-2.686,6-6V94.74l88.833,52.883   l-65.324,42.087c-2.785,1.795-3.589,5.508-1.794,8.293c1.796,2.786,5.508,3.59,8.294,1.794l73.465-47.333   c1.746-1.125,2.786-3.073,2.749-5.15c-0.037-2.077-1.145-3.987-2.93-5.05L115.733,79.029   C113.877,77.926,111.575,77.902,109.699,78.969z"
                                                                                            data-original="#000000" class="active-path"
                                                                                            data-old_color="#ffffff" fill="#ffffff"
                                                                                        />
                                                                                    </g>
                                                                                </g>
                                                                            </svg>
                                                            </router-link>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                        </router-link>

                                        <!-- END Poster -->

                                        <div class="progress" v-if="item.current_time !== null && $auth.isAuthenticated() === 'active' ">
                                            <div class="progress-bar" role="progressbar" :style="{width: (item.current_time/item.duration_time)*100 + '%'}" :aria-valuenow="(item.current_time/item.duration_time)*100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>

                                    </div>

                                    <!-- END Movies List -->

                                    <div class="poster" @mouseover="ACTIVE_SLELECTED_SERIES(item.id, rootindex )" v-if="item.type === 'series'">

                                        <router-link :to="{name: 'show-series', params: {id: item.id}}">
                                            <div class="poster__backdrop-image">

                                                <progressive-img :src="'/storage/backdrops/600_' + item.backdrop" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" v-if="item.cloud === 'local' " />

                                                <progressive-img :src="md_backdrop + item.backdrop" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" v-if="item.cloud === 'aws' " />

                                                <div class="poster__backdrop_overlay-info" v-if="active_series === item.id">

                                                    <div class="body text-center">

                                                        <div class="play">


                                                            <router-link :to="{name: 'series-player-sp', params:{episode_id: item.episode_id, series_id: item.id}}">

                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px"
                                                                            viewBox="0 0 294.843 294.843" style="enable-background:new 0 0 294.843 294.843;"
                                                                            xml:space="preserve" width="100%" class="play-svg">
                                                                            <g>
                                                                                <g>
                                                                                    <path d="M278.527,79.946c-10.324-20.023-25.38-37.704-43.538-51.132c-2.665-1.97-6.421-1.407-8.392,1.257s-1.407,6.421,1.257,8.392   c16.687,12.34,30.521,28.586,40.008,46.983c9.94,19.277,14.98,40.128,14.98,61.976c0,74.671-60.75,135.421-135.421,135.421   S12,222.093,12,147.421S72.75,12,147.421,12c3.313,0,6-2.687,6-6s-2.687-6-6-6C66.133,0,0,66.133,0,147.421   s66.133,147.421,147.421,147.421s147.421-66.133,147.421-147.421C294.842,123.977,289.201,100.645,278.527,79.946z"
                                                                                        data-original="#000000" class="active-path"
                                                                                        data-old_color="#ffffff" fill="#ffffff"
                                                                                    />
                                                                                    <path d="M109.699,78.969c-1.876,1.067-3.035,3.059-3.035,5.216v131.674c0,3.314,2.687,6,6,6s6-2.686,6-6V94.74l88.833,52.883   l-65.324,42.087c-2.785,1.795-3.589,5.508-1.794,8.293c1.796,2.786,5.508,3.59,8.294,1.794l73.465-47.333   c1.746-1.125,2.786-3.073,2.749-5.15c-0.037-2.077-1.145-3.987-2.93-5.05L115.733,79.029   C113.877,77.926,111.575,77.902,109.699,78.969z"
                                                                                        data-original="#000000" class="active-path"
                                                                                        data-old_color="#ffffff" fill="#ffffff"
                                                                                    />
                                                                                </g>
                                                                            </g>
                                                                        </svg>
                                                                </router-link>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>
                                        </router-link>

                                        <!-- END Poster -->

                                        <div class="progress" v-if="item.current_time !== null && $auth.isAuthenticated() === 'active' ">
                                            <div class="progress-bar" role="progressbar" :style="{width: (item.current_time/item.duration_time)*100 +'%'}" :aria-valuenow="(item.current_time/item.duration_time)*100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>

                        <div class="carousel mt-1 m-3 mb-5" v-for="(item, rootindex) in data.data" :key="rootindex" v-if="item.list.length > 0 ">
                            <div class="genre ml-4">

                                <h3 v-if="data.data[rootindex].type === 'Movies'">
                                    <strong >
                                            {{item.genre}}

                                            <hr>
                                        </strong>
                                    <small class="text-muted">{{$t('home.movies')}}</small>
                                </h3>

                                <h3 v-if="data.data[rootindex].type === 'Series'">
                                    <strong> {{item.genre}}

                                            <hr>
                                        </strong>
                                    <small class="text-muted">{{$t('home.series')}}</small>
                                </h3>

                            </div>

                            <carousel class="list-carousel" navigationPrevLabel='<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 129 129" enable-background="new 0 0 129 129" width="100%" class="arrow-right-svg"><g><g>
                                                            <path d="m88.6,121.3c0.8,0.8 1.8,1.2 2.9,1.2s2.1-0.4 2.9-1.2c1.6-1.6 1.6-4.2 0-5.8l-51-51 51-51c1.6-1.6 1.6-4.2 0-5.8s-4.2-1.6-5.8,0l-54,53.9c-1.6,1.6-1.6,4.2 0,5.8l54,53.9z" data-original="#000000" class="active-path" data-old_color="#ffffff" fill="#ffffff"/>
                                                          </g></g> </svg>' navigationNextLabel='<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" viewBox="0 0 129 129" enable-background="new 0 0 129 129" width="100%" class="arrow-left-svg"><g transform="matrix(-1 1.22465e-16 -1.22465e-16 -1 129 129)"><g>
                                                            <path d="m88.6,121.3c0.8,0.8 1.8,1.2 2.9,1.2s2.1-0.4 2.9-1.2c1.6-1.6 1.6-4.2 0-5.8l-51-51 51-51c1.6-1.6 1.6-4.2 0-5.8s-4.2-1.6-5.8,0l-54,53.9c-1.6,1.6-1.6,4.2 0,5.8l54,53.9z" data-original="#000000" class="active-path" data-old_color="#ffffff" fill="#ffffff"/>
                                                          </g></g> </svg>':navigationEnabled="true" :paginationEnabled="false" :autoplay="false" easing="linear" :scrollPerPage="true" :perPageCustom="[[220,1], [520,2],[768, 3], [1024, 5], [1300, 7]]">

                                <slide class="col-6 col-md-4 col-lg-2 col-xxl-1-5 m-2 animation" v-for="(item, index) in data.data[rootindex].list" :key="index">

                                    <div class="poster" @mouseover="ACTIVE_SLELECTED_MOVIE(item.id, rootindex )" v-if="data.data[rootindex].type === 'Movies'">

                                        <router-link :to="{name: 'show-movie', params: {id: item.id}}">
                                            <div class="poster__backdrop-image">

                                                <progressive-img :src="'/storage/posters/600_' + item.poster" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" :aspect-ratio="1.5" :blur="0" v-if="item.cloud === 'local' " />

                                                <progressive-img :src=" md_poster + item.poster" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" :aspect-ratio="1.5" :blur="0" v-if="item.cloud === 'aws' " />

                                                <div class="poster__backdrop_overlay-info" v-if="active_movie === item.id && root_index_active === rootindex ">

                                                    <div class="header pull-right">

                                                        <div class="mt-0">

                                                            <div class="poster__add-collection-icon text-right" v-if="! item.is_favorite">

                                                                <img src="/themes/default/img/infavor.svg" alt="favor" width="100%" @click.prevent="SHOW_COLLECTION_MODAL(item.id, '/storage/backdrops/600_' + item.backdrop, item.name, 'movie', rootindex, index)"  v-if="item.cloud == 'local'">
                                                                <img src="/themes/default/img/infavor.svg" alt="favor" width="100%" @click.prevent="SHOW_COLLECTION_MODAL(item.id, md_backdrop + item.backdrop, item.name, 'movie', rootindex, index)"  v-if="item.cloud == 'aws'">

                                                                </div>

                                                                <div class="poster__remove-collection-icon text-right" v-if="item.is_favorite">
                                                                    <img src="/themes/default/img/favor.svg" alt="favor" width="100%" @click.prevent="DELETE_FROM_COLLECTION(item.id, 'movie', rootindex, index)" >

                                                                </div>

                                                                </div>

                                                                <!-- END My List -->

                                                                <div class="mt-1">

                                                                    <div class="poster__add-like-icon text-right" v-if="! item.is_like">
                                                                        <img src="/themes/default/img/dislike.svg" alt="dislike" width="100%" @click.prevent="ADD_NEW_LIKE(item.id, 'movie', rootindex, index, 'add')">
                                                                </div>

                                                                        <div class="poster__remove-like-icon  text-right" v-if="item.is_like">

                                                                            <img src="/themes/default/img/like.svg" alt="dislike" width="100%" @click.prevent="ADD_NEW_LIKE(item.id, 'movie', rootindex, index, 'delete')">

                                                                </div>

                                                                        </div>

                                                                        <!-- END Likes -->

                                                                    </div>
                                                                    <!-- END Header -->

                                                                    <div class="body text-center">

                                                                        <div class="play">

                                                                            <router-link :to="{name: 'movie-player', params: {id: item.id}}">

                                                                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px"
                                                                                viewBox="0 0 294.843 294.843" style="enable-background:new 0 0 294.843 294.843;"
                                                                                xml:space="preserve" width="100%" class="play-svg">
                                                                                <g>
                                                                                    <g>
                                                                                        <path d="M278.527,79.946c-10.324-20.023-25.38-37.704-43.538-51.132c-2.665-1.97-6.421-1.407-8.392,1.257s-1.407,6.421,1.257,8.392   c16.687,12.34,30.521,28.586,40.008,46.983c9.94,19.277,14.98,40.128,14.98,61.976c0,74.671-60.75,135.421-135.421,135.421   S12,222.093,12,147.421S72.75,12,147.421,12c3.313,0,6-2.687,6-6s-2.687-6-6-6C66.133,0,0,66.133,0,147.421   s66.133,147.421,147.421,147.421s147.421-66.133,147.421-147.421C294.842,123.977,289.201,100.645,278.527,79.946z"
                                                                                            data-original="#000000" class="active-path"
                                                                                            data-old_color="#ffffff" fill="#ffffff"
                                                                                        />
                                                                                        <path d="M109.699,78.969c-1.876,1.067-3.035,3.059-3.035,5.216v131.674c0,3.314,2.687,6,6,6s6-2.686,6-6V94.74l88.833,52.883   l-65.324,42.087c-2.785,1.795-3.589,5.508-1.794,8.293c1.796,2.786,5.508,3.59,8.294,1.794l73.465-47.333   c1.746-1.125,2.786-3.073,2.749-5.15c-0.037-2.077-1.145-3.987-2.93-5.05L115.733,79.029   C113.877,77.926,111.575,77.902,109.699,78.969z"
                                                                                            data-original="#000000" class="active-path"
                                                                                            data-old_color="#ffffff" fill="#ffffff"
                                                                                        />
                                                                                    </g>
                                                                                </g>
                                                                            </svg>
                                                                            </router-link>

                                                                        </div>

                                                                    </div>

                                                                </div>

                                                            </div>
                                        </router-link>

                                        <div class="__title mt-2">
                                            <b> {{item.name}} </b> <br>
                                            <small class="text-muted">{{item.genre}}</small>
                                        </div>

                                        <div class="progress" v-if="item.current_time !== null && $auth.isAuthenticated() === 'active' ">
                                            <div class="progress-bar" role="progressbar" :style="{width: (item.current_time/item.duration_time)*100 +'%'}" :aria-valuenow="(item.current_time/item.duration_time)*100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>

                                    </div>

                                    <!-- END Movies List -->

                                    <div class="poster" @mouseover="ACTIVE_SLELECTED_SERIES(item.id, rootindex)" v-if="data.data[rootindex].type === 'Series'">

                                        <router-link :to="{name: 'show-series', params: {id: item.id}}">

                                            <div class="poster__backdrop-image">

                                                <progressive-img :src="'/storage/posters/600_' + item.poster" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" :aspect-ratio="1.5" :blur="0" v-if="item.cloud === 'local' " />

                                                <progressive-img :src=" md_poster + item.poster" placeholder="/themes/default/img/loader-image.png" :alt="item.name" width="100%" :aspect-ratio="1.5" :blur="0" v-if="item.cloud === 'aws' " />

                                                <div class="poster__backdrop_overlay-info" v-if="active_series === item.id && root_index_active === rootindex">

                                                    <div class="header pull-right">

                                                        <div class="mt-0">

                                                            <div class="poster__add-collection-icon text-right" v-if="! item.is_favorite">

                                                                <img src="/themes/default/img/infavor.svg" alt="favor" width="100%" @click.prevent="SHOW_COLLECTION_MODAL(item.id, '/storage/backdrops/600_' + item.backdrop, item.name, 'series', rootindex, index)"  v-if="item.cloud == 'local'">
                                                                <img src="/themes/default/img/infavor.svg" alt="favor" width="100%" @click.prevent="SHOW_COLLECTION_MODAL(item.id, md_backdrop + item.backdrop, item.name, 'series', rootindex, index)"  v-if="item.cloud == 'aws'">

                                                                </div>

                                                                <div class="poster__remove-collection-icon text-right" v-if="item.is_favorite">
                                                                    <img src="/themes/default/img/favor.svg" alt="favor" width="100%" @click.prevent="DELETE_FROM_COLLECTION(item.id, 'series', rootindex, index)" >

                                                                </div>

                                                                </div>

                                                                <!-- END My List -->

                                                                <div class="mt-1">

                                                                    <div class="poster__add-like-icon text-right" v-if="! item.is_like">
                                                                        <img src="/themes/default/img/dislike.svg" alt="dislike" width="100%" @click.prevent="ADD_NEW_LIKE(item.id, 'series', rootindex, index, 'add')">
                                                                </div>

                                                                        <div class="poster__remove-like-icon  text-right" v-if="item.is_like">
                                                                            <img src="/themes/default/img/like.svg" alt="like" width="100%" @click.prevent="ADD_NEW_LIKE(item.id, 'series', rootindex, index, 'delete')">
                                                                </div>

                                                                        </div>

                                                                    </div>
                                                                    <!-- END Header -->

                                                                    <div class="body text-center">

                                                                        <div class="play">


                                                                            <div v-if="item.already_episode !== 0 && item.already_episode !== null">

                                                                                <router-link :to="{name: 'series-player', params: {series_id: item.id}}">

                                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px"
                                                                                viewBox="0 0 294.843 294.843" style="enable-background:new 0 0 294.843 294.843;"
                                                                                xml:space="preserve" width="100%" class="play-svg">
                                                                                <g>
                                                                                    <g>
                                                                                        <path d="M278.527,79.946c-10.324-20.023-25.38-37.704-43.538-51.132c-2.665-1.97-6.421-1.407-8.392,1.257s-1.407,6.421,1.257,8.392   c16.687,12.34,30.521,28.586,40.008,46.983c9.94,19.277,14.98,40.128,14.98,61.976c0,74.671-60.75,135.421-135.421,135.421   S12,222.093,12,147.421S72.75,12,147.421,12c3.313,0,6-2.687,6-6s-2.687-6-6-6C66.133,0,0,66.133,0,147.421   s66.133,147.421,147.421,147.421s147.421-66.133,147.421-147.421C294.842,123.977,289.201,100.645,278.527,79.946z"
                                                                                            data-original="#000000" class="active-path"
                                                                                            data-old_color="#ffffff" fill="#ffffff"
                                                                                        />
                                                                                        <path d="M109.699,78.969c-1.876,1.067-3.035,3.059-3.035,5.216v131.674c0,3.314,2.687,6,6,6s6-2.686,6-6V94.74l88.833,52.883   l-65.324,42.087c-2.785,1.795-3.589,5.508-1.794,8.293c1.796,2.786,5.508,3.59,8.294,1.794l73.465-47.333   c1.746-1.125,2.786-3.073,2.749-5.15c-0.037-2.077-1.145-3.987-2.93-5.05L115.733,79.029   C113.877,77.926,111.575,77.902,109.699,78.969z"
                                                                                            data-original="#000000" class="active-path"
                                                                                            data-old_color="#ffffff" fill="#ffffff"
                                                                                        />
                                                                                    </g>
                                                                                </g>
                                                                            </svg>
                                                                                </router-link>

                                                                            </div>
                                                                            <div v-else>
                                                                                <h3>
                                                                                    <strong>{{$t('show.soon')}}</strong>
                                                                                </h3>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                    <!-- END Ovarlay -->

                                                                </div>

                                                            </div>

                                        </router-link>

                                        <div class="__title mt-2">
                                            <b> {{item.name}} </b> <br>
                                            <small class="text-muted">{{item.genre}}</small>
                                        </div>

                                        <div class="progress" v-if="item.current_time !== null && $auth.isAuthenticated() === 'active' ">
                                            <div class="progress-bar" role="progressbar" :style="{width: (item.current_time/item.duration_time)*100 +'%'}" :aria-valuenow="(item.current_time/item.duration_time)*100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>

                                    </div>
                                </slide>
                            </carousel>
                        </div>
                    </div>
                </div>

            </div>
        </div>





            <div class="discover-page__brand">
                <div class="container">
            <div class="col-12">
               
<ul class="ourbest__client">

<li><img src="/images/i1.svg"></li>
<li><img src="/images/i3.svg"></li>
<li><img src="/images/i4.svg"></li>
<li><img src="/images/i5.svg"></li>
<li><img src="/images/i6.svg"></li> 
 
    </ul>

             
            </div>
            </div>
        
</div>

     
    </div>




    <div v-else>
        <div class="my-5 col-lg-6 offset-lg-3 text-center">
            <h4>{{$t('home.sorry_no_result')}}</h4>
        </div>
    </div>
        <div class="count__text__90">
                <div class="container">
            <div class="count__by__count__98">
               
<div class="col-4">

  <div class="count__first__n">
      <h2 class="mc-text-h2 mc-mb-3">75+ Classes</h2>
      <p>What is Lorem Ipsum?</p>
      </div>  
</div>


<div class="col-4">

  <div class="count__first__n">
      <h2 class="mc-text-h2 mc-mb-3">20 Lessons</h2>
      <p>Why do we use it?</p>
      </div>  
</div>


<div class="col-4">

  <div class="count__first__n">
      <h2 class="mc-text-h2 mc-mb-3">5 Minutes</h2>
      <p>Where does it come from?</p>
      </div>  
</div>

             
            </div>
            </div>
        </div>



   <div class="video__section__12">
       <div class="container">
<div class="heading__all__center">
<h3>Where can I get some?</h3>
<p>Contrary to popular belief, Lorem Ipsum is not simply random text.</p>

</div>

<div class="col-12">
<div class="video__section">

    <img src="/images/erdf.png"/>
</div>
</div>

       </div>
       
       
       </div>     



       <div class="our__newest__class">
           <div class="container">
<div class="heading__all__center">
<h3>Our Newest Classes</h3>


</div>
<div class="col-12">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/top___banner_09.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
        <h4 class="mc-text-h4">Why do we use it?</h4>
        <p class="mc-opacity--muted">It is a long established fact that a reader will be distracted</p>
        </div>
    </div>           
       </div>




       <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc1.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
        <h4 class="mc-text-h4">Where can I get some?</h4>
        <p class="mc-opacity--muted">There are many variations of passages of Lorem Ipsum </p>
        </div>
    </div>           
       </div>

            <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc2.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
        <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>


             <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc3.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
        <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>


             <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc4.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
       <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>


             <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc5.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
       <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>

        <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc6.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
       <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>


        <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc7.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
       <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>


        <div class="col-6">
<div class="big__single__img">
    <div class="single__09__0">
        <img src="/images/cc8.webp" />
        <div class="gradient"></div>
    </div>
    <div class="mc-tile-caption__content mc-p-3">
       <h4 class="mc-text-h4">What is Lorem Ipsum?</h4>
        <p class="mc-opacity--muted">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>
        </div>
    </div>           
       </div>
</div>
</div>


<div class="whatstudents">
<div class="container">
<div class="heading__all__center"><h3>What Students Are Saying</h3>

</div>

<div class="whats__studet__say0988">

<div class="col-4">
<div class="student__listing__one__by__one">
    <div class="student__img__and__name">
<div class="student__pic">
<img src="/images/student1.png" />

</div>
<div class="student__name__s">
<h2 class="mc-text-h6 mc-text--uppercase">Neeraj Pandey</h2>
<p class="mc-text-small mc-opacity--muted">Photography</p>

</div>

    </div>

    <div class="student__sayes__content">
       
        <p class="mc-mb-4">It is a long established fact that a reader will
             be distracted by the readable content of a page when looking
              at its layout. The point of using Lorem Ipsum is that it 
              eadable English.</p>
            <div class="user__views__09">
                <div class="user__view__img__09">
                    <img src="/images/user__view.png" />
                    </div>
                    <h3 class="mc-text-h7 mc-opacity--muted">Jesse L.</h3>
            </div>
    </div>
</div>
    </div>


    <div class="col-4">
<div class="student__listing__one__by__one">
    <div class="student__img__and__name">
<div class="student__pic">
<img src="/images/student1.png" />

</div>
<div class="student__name__s">
<h2 class="mc-text-h6 mc-text--uppercase">Anil Tomar</h2>
<p class="mc-text-small mc-opacity--muted">Photography</p>

</div>

    </div>

    <div class="student__sayes__content">
       
        <p class="mc-mb-4">It is a long established fact that a reader will
             be distracted by the readable content of a page when looking
              at its layout. The point of using Lorem Ipsum is that it 
              eadable English.</p>
            <div class="user__views__09">
                <div class="user__view__img__09">
                    <img src="/images/user__view.png" />
                    </div>
                    <h3 class="mc-text-h7 mc-opacity--muted">Jesse L.</h3>
            </div>
    </div>
</div>
    </div>


    <div class="col-4">
<div class="student__listing__one__by__one">
    <div class="student__img__and__name">
<div class="student__pic">
<img src="/images/student1.png" />

</div>
<div class="student__name__s">
<h2 class="mc-text-h6 mc-text--uppercase">Aftab Raja</h2>
<p class="mc-text-small mc-opacity--muted">Photography</p>

</div>

    </div>

    <div class="student__sayes__content">
       
        <p class="mc-mb-4">It is a long established fact that a reader will
             be distracted by the readable content of a page when looking
              at its layout. The point of using Lorem Ipsum is that it 
              eadable English.</p>
            <div class="user__views__09">
                <div class="user__view__img__09">
                    <img src="/images/user__view.png" />
                    </div>
                    <h3 class="mc-text-h7 mc-opacity--muted">Jesse L.</h3>
            </div>
    </div>
</div>
    </div>
</div>

</div>
</div>


<div class="pricing__section">
<div class="container">

   <div class="heading__all__center"><h3>Pricing Guide</h3></div>

   <div class="pricing_one_education">

       <div class="pricing__image">

           <img src="/images/kids.jpg" />
       </div>
       <div class="cotagrois_define">
           <h3>Kids Learning</h3>
           
           </div>

           <div class="pricing__footer__0">
               <p class="pricing__0">$190 / Mo.</p>
               <p>Ideal for Bloggers / Start-Ups / Small Businesses with a limited budget.</p>
                <p class="buy__now"><a href="#">Buy Now</a></p>
           </div>
       </div>


        <div class="pricing_one_education">

       <div class="pricing__image">

           <img src="/images/school-education.jpg" />
       </div>
       <div class="cotagrois_define">
           <h3>School Education</h3>
           
           </div>

           <div class="pricing__footer__0">
               <p class="pricing__0">$290 / Mo.</p>
               <p>Ideal for Bloggers / Start-Ups / Small Businesses with a limited budget.</p>
                <p class="buy__now"><a href="#">Buy Now</a></p>
           </div>
       </div>


        <div class="pricing_one_education">

       <div class="pricing__image">

           <img src="/images/werr.webp" />
       </div>
       <div class="cotagrois_define">
           <h3>Entrepreneurs</h3>
           
           </div>

           <div class="pricing__footer__0">
               <p class="pricing__0">$500 / Mo.</p>
               <p>Ideal for Bloggers / Start-Ups / Small Businesses with a limited budget.</p>
               <p class="buy__now"><a href="#">Buy Now</a></p>
           </div>
       </div>
</div>

</div>

<div class="learnform__section">
<div class="container">

    <div class="verbiage"><h2>LEARN FROM THE BEST</h2>
    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected</p>
    <p class="cta">
        <a id="homepage-blog-link" href="#">Read More
        </a>
        </p>
        </div>
</div>

</div>


<div class="fooetr__section">
    <div class="container">

        <div class="footer__one__section__23">
            <div class="footer__logo">
                <img src="/images/logo.png" />
            </div>
            </div>

  <div class="footer__one__section__23">
            <div class="site-footer-v3__column">
	<div class="site-footer-v3__link-header">Menu</div>
	<ul class="site-footer-v3__links">
		<li class="site-footer-v3__link"><a href="#">Classes</a></li>
		<li class="site-footer-v3__link"><a href="#">All-Access</a></li>
		<li class="site-footer-v3__link"><a href="#">Gifts</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Support</a></li>
		<li class="site-footer-v3__link"><a href="#">Articles</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Enterprise</a></li>
	</ul>
</div>
</div>

  <div class="footer__one__section__23">
            <div class="site-footer-v3__column">
	<div class="site-footer-v3__link-header">Menu</div>
	<ul class="site-footer-v3__links">
		<li class="site-footer-v3__link"><a href="#">Classes</a></li>
		<li class="site-footer-v3__link"><a href="#">All-Access</a></li>
		<li class="site-footer-v3__link"><a href="#">Gifts</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Support</a></li>
		<li class="site-footer-v3__link"><a href="#">Articles</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Enterprise</a></li>
	</ul>
</div>
</div>

  <div class="footer__one__section__23">
            <div class="site-footer-v3__column">
	<div class="site-footer-v3__link-header">Menu</div>
	<ul class="site-footer-v3__links">
		<li class="site-footer-v3__link"><a href="#">Classes</a></li>
		<li class="site-footer-v3__link"><a href="#">All-Access</a></li>
		<li class="site-footer-v3__link"><a href="#">Gifts</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Support</a></li>
		<li class="site-footer-v3__link"><a href="#">Articles</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Enterprise</a></li>
	</ul>
</div>
</div>

  <div class="footer__one__section__23">
            <div class="site-footer-v3__column">
	<div class="site-footer-v3__link-header">Menu</div>
	<ul class="site-footer-v3__links">
		<li class="site-footer-v3__link"><a href="#">Classes</a></li>
		<li class="site-footer-v3__link"><a href="#">All-Access</a></li>
		<li class="site-footer-v3__link"><a href="#">Gifts</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Support</a></li>
		<li class="site-footer-v3__link"><a href="#">Articles</a></li>
		<li class="site-footer-v3__link"><a target="_blank" href="#">Enterprise</a></li>
	</ul>
</div>
</div>
    </div>
    </div>

    
<div class="site-footer-v3__legal">
	<p><span class="site-footer-v3__secured-with">
		<img alt="" class="lazy loaded" data-src="" src="/images/lock.svg" data-was-processed="true">Secured with SSL</span>
        <span class="site-footer-v3__copyright">Copyright © 2020 Education Stream</span></p>
</div>
</div>
</template>

<script>
import {
    mapState
} from "vuex";
import {
    Carousel,
    Slide
} from "vue-carousel";
import collection from "./collection/new.vue";
import loader from "./utils/loader"

export default {
    name: "home",
    components: {
        Carousel,
        Slide,
        loader,
        "collection-modal": collection
    },
    data() {
        return {
            active_series: null,
            active_movie: null,
            recenlty_active: null,
            root_index_active: null,
            root_index_show: null,
            show_item: null,
            collection: {
                id: null,
                poster: null,
                name: null,
                type: null,
                rootindex: null,
                index: null
            }
        };
    },

    computed: mapState({
        data: state => state.home.data,
        loading: state => state.home.home_loading,
    }),

    mounted() {
        if (this.$auth.isAuthenticated()) {
            this.$store.dispatch("GET_HOME_LIST");
        } else {
            this.$store.dispatch("GET_GHOST_HOME_LIST");
        }
    },

    methods: {
        // Show modal of collection
        SHOW_COLLECTION_MODAL(id, backdrop, name, type, rootindex, index) {
            if (this.$auth.isAuthenticated()) {
                this.collection.id = id;
                this.collection.poster = backdrop;
                this.collection.name = name;
                this.collection.type = type;
                this.collection.rootindex = rootindex;
                this.collection.index = index;
            } else {
                this.$router.push({
                    name: 'login'
                })
            }
        },

        // Hide modal of collection
        HIDE_COLLECTION_MODAL_CANCEL() {
            if (this.$auth.isAuthenticated()) {
                this.collection.id = null;
            } else {
                this.$router.push({
                    name: 'login'
                })
            }
        },

        // Hide modal and update array
        HIDE_COLLECTION_MODAL_SAVE() {
            if (this.$auth.isAuthenticated()) {
                this.collection.id = null;
                if (this.collection.rootindex !== null) {
                    // For list
                    this.data.data[this.collection.rootindex].list[
                        this.collection.index
                    ].is_favorite = true;
                } else {
                    // For top
                    this.data.top[this.collection.index].is_favorite = true;
                }
            } else {
                this.$router.push({
                    name: 'login'
                })
            }
        },

        // Delete mvoie or series from data array
        DELETE_FROM_COLLECTION(id, type, rootindex, index) {
            if (this.$auth.isAuthenticated()) {
                if (rootindex !== null) {
                    // For list
                    this.data.data[rootindex].list[index].is_favorite = false;
                } else {
                    // For top
                    this.data.top[index].is_favorite = false;
                }
                this.$store.dispatch("DELETE_FROM_COLLECTION", {
                    id,
                    type
                });
            } else {
                this.$router.push({
                    name: 'login'
                })
            }
        },

        // Add new like or delete it
        // Params type1 detected if add or delete
        ADD_NEW_LIKE(id, type, rootindex, index, type1) {
            if (this.$auth.isAuthenticated()) {
                if (type1 === "add") {
                    // Add true to data array
                    this.data.data[rootindex].list[index].is_like = true;
                    this.$store.dispatch("ADD_LIKE", {
                        id,
                        type
                    });
                } else {
                    // Add false to data array
                    this.data.data[rootindex].list[index].is_like = false;

                    this.$store.dispatch("ADD_LIKE", {
                        id,
                        type
                    });
                }
            } else {
                this.$router.push({
                    name: 'login'
                })
            }
        },

        ACTIVE_SLELECTED_SERIES(id, rootindex) {
            this.root_index_active = rootindex;
            this.active_movie = null;
            this.active_series = id;
        },

        ACTIVE_SLELECTED_MOVIE(id, rootindex) {
            this.root_index_active = rootindex;
            this.active_series = null;
            this.active_movie = id;
        },

    },

    filters: {
        // Cut word
        truncate(string, value) {
            return string.substring(0, value) + "...";
        }
    }
};
</script>
<style>
    .progressive-image-main{
        height: 100% !important;
    }
    .top-item .VueCarousel-wrapper .VueCarousel-slide {
	height: 86vh;
}
.top-item {
	min-height: 450px;
	height: 91vh;
	margin-top: -100px;
}
.top-item .VueCarousel-wrapper .VueCarousel-slide {
	height: 92vh;
	padding-left: 81px;
	padding-right: 78px;
}
.ourbest__client li {
	list-style: none;
	display: inline-block;
	margin: ;
	width: 19%;
	text-align: center;
}
.pricing_one_education {
	float: left;
	width: 33%;
	padding: 14px;
}
.pricing__image img {
	width: 100%;
}
.buy__now a {
	background: #000;
	padding: 6px 35px 5px 35px;
	box-shadow: 0 0 2px 1px #4d4d4d;
	border-radius: 3px;
	margin-top: 16px;
	display: inline-block;
}
.pricing__section {
	float: left;
	width: 100%;
	background: #191C21;
	padding-top: 47px;
	padding-bottom: 18px;
	margin-bottom: -65px;
	margin-top: 54px;
}
.pricing_one_education {
	float: left;
	width: 30.8%;
	 padding: 0px;
	border: 1px solid #fff;
	margin-left: 15px;
	margin-right: 15px;
}


.cotagrois_define h3 {
	font-size: 20px;


	margin-bottom: 0px;
	padding: 8px;
}
.pricing__footer__0 {
	text-align: center;
	padding: 36px;
}
.pricing__0 {
	font-size: 46px;
    
    
}
.cotagrois_define {
	
	margin-top: -39px;
	position: relative;
	padding: 2px;
	background: -webkit-gradient(linear, left top, left bottom, from(rgba(73, 73, 73, 0)), color-stop(80%, #201d1d));
	background: linear-gradient(rgba(73, 73, 73, 0) 0%, #fff 80%);
	text-align: center;
	text-transform: uppercase;
}
.pricing_one_education {
	float: left;
	width: 30.8%;
	padding: 0px;
	border: 1px solid #ffffff26;
	margin-left: 15px;
    margin-right: 15px;
    background: #fff;
}
.pricing__footer__0 {
	text-align: center;
	padding: 36px;
	color: #000;
}
.pricing__section {
	float: left;
	width: 100%;
	background: #191C21;
	padding-top: 54px;
	padding-bottom: 79px;
	margin-bottom: -65px;
	margin-top: 54px;
}
.fooetr__section {
	float: left;
	width: 100%;
}
#mainFooter {
	display: none;
}
.ourbest__client {
	margin-top: 65px;
}
.top-item__film-ovarlay {
	position: absolute;
	bottom: 198px;
	width: 100%;
	z-index: 1;
}
.top-item__film-cover {
	max-height: 100%;
	position: relative;
	padding-top: 74px;
}
.navbar-content .nav-md .bg-inverse {
	background-color: transparent !important;
	padding: 10px 7%;
}
.count__text__90 {
	background: #191C21;
	margin-top: 61px;
	padding-top: 47px;
	padding-bottom: 47px;
}
.count__by__count__98 .col-4 {
	float: left;
}
.count__first__n {
	text-align: center;
}
.count__text__90 {
	background: #191C21;
	margin-top: 49px;
	padding-top: 47px;
	padding-bottom: 47px;
	float: left;
	width: 100%;
}
.mc-text-h2.mc-mb-3 {
	font-size: 39px;
}
.count__first__n p {
	color: #B6B8BB;
	font-size: 19px;
}
#mainFooter {

	bottom: inherit;
	left: 0;
}
.video__section img {
	width: 100%;
}

.video__section__12 {
	float: left;
	width: 100%;
	padding-top: 46px;
	padding-bottom: 48px;
}
.heading__all__center {
	text-align: center;
	padding-bottom: 33px;
}
.heading__all__center h3 {
	font-size: 37px;
}
.heading__all__center p {
	color: #B6B8BB;
}
.single__09__0 img {
	width: 100%;
}
.container {
	width: 1235px;
	max-width: 100%;
}
.our__newest__class {
	float: left;
	width: 100%;
}
.heading__all__center h3 {
	font-size: 37px;
	font-weight: 600;
}

body {

	background-color: #000000;
	
}
.discover-page__brand {
	padding-top: 70px;
}

.gradient {
	position: absolute;
	right: 0px;
	bottom: 0;
	left: 0px;
	height: 250px;
	z-index: 1;
	background: -webkit-gradient(linear, left top, left bottom, from(rgba(73, 73, 73, 0)), color-stop(80%, #0e0e0e));
	background: linear-gradient(rgba(73, 73, 73, 0) 0%, #0e0e0e 80%);
}
.mc-tile-caption__content.mc-p-3 {
	/* margin-top: -14px; */
	padding-bottom: 7px;
}
.mc-tile-caption__content.mc-p-3 {
	position: relative;
	z-index: 9;
}

.mc-tile-caption__content.mc-p-3 { 
	/* margin-top: -14px; */
	padding-bottom: 9px;
	margin-top: -68px;
	padding-left: 14px;
}

.our__newest__class .col-6 {
	float: left;
	margin-top: 33px;
}
.our__newest__class .gradient {
	position: absolute;
	right: 0px;
	bottom: 0;
	left: 0px;
	height: 250px;
	z-index: 1;
	background: -webkit-gradient(linear, left top, left bottom, from(rgba(73, 73, 73, 0)), color-stop(80%, #020202));
	background: linear-gradient(rgba(73, 73, 73, 0) 0%, #000 80%);
	left: 12px;
	width: 98%;
}
.top-item .gradient {

	background: -webkit-gradient(linear, left top, left bottom, from(rgba(73, 73, 73, 0)), color-stop(80%, #0e0e0e));
	background: linear-gradient(rgba(73, 73, 73, 0) 0%, #000 80%)!important;
}
.discover-page__brand {
	padding-top: 6px;
}
.student__listing__one__by__one {
	background: #fff;
	padding: 24px;
	border-radius: 5px;
	color: #000;
}
.student__pic {
	float: left;
	margin-right: 17px;
}
.student__pic img {
	height: 56px;
	width: 56px;
}
.mc-text-h6.mc-text--uppercase {
	font-size: 20px;
	text-transform: uppercase;
	margin-bottom: 0px;
	/* font-weight: 600; */
}
.mc-text-small.mc-opacity--muted {
	color: #716d6d;
	font-size: 14px;
}
.mc-mb-4 {
	margin-top: 31px;
	font-size: 16px;
}
.cotagrois_define h3 {
	font-size: 20px;
	margin-bottom: 0px;
	padding: 8px;
	position: relative;
    top: 15px;
    color: #000;
}
.user__view__img__09 {
	float: left;
	margin-right: 14px;
}
.mc-text-h7.mc-opacity--muted {
	font-size: 16px;
	color: #555;
	padding-top: 9px;
}
.whats__studet__say0988 .col-4 {
	float: left;
}
.whatstudents {
	float: left;
	width: 100%;
	padding-top: 74px;

	padding-bottom: 36px;
}
.learnform__section {
	float: left;
	width: 100%;
	text-align: center;
	background-image: url(/images/back__oi.jpg);
	padding-top: 88px;
	padding-bottom: 88px;
	margin-top: 62px;
}

.verbiage p {
	font-size: 19px;
	margin-top: 23px;
}










.fooetr__section .footer__one__section__23 {
	float: left;
	width: 20%;
}
.site-footer-v3__link-header {
	color: #596170;
	text-transform: uppercase;
	margin-bottom: 20px;
}
.site-footer-v3__links li {
	padding: 0px;
	list-style: none;
}
.site-footer-v3__links {
	padding-left: 0px;
	line-height: 30px;
}
.site-footer-v3__column li a {
	color: #949AA4;
}
.footer__logo img {
	width: 109px;
}
.fooetr__section {
	float: left;
	width: 100%;
	padding-top: 77px;
	border-top: 1px solid #2b2b2b;
}
.learnform__section {
	border-top: 1px solid #2b2b2b;
}
.site-footer-v3__legal {
    
    
	float: left;
	width: 100%;
	text-align: center;
	margin-top: 47px;
	color: #807878;
}
.lazy.loaded {
	margin-right: 13px;
}
.pricing__image {
	height: 236px;
	overflow: hidden;
}
.footer__logo img {
	width: 72px;
}
.navbar-content .nav-md .nav-background {

	height: 68px;
	
}
</style>
