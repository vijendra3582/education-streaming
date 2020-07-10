<template>
   <div>
      <div class="k1_manage_table">
         <div class="title p-2">{{$t('single_video.custom_upload')}}</div>
         <div class="col-12">
            <div class="row">
               <div class="col-12 col-lg-6">
                  <div class="form-group">
                     <div class="col-12">
                        <label>{{$t('single_video.choose_cloud')}}</label>
                     </div>
                     <div class="col-12 cloud-upload">
                        <div class="row">
                           <div class="col-12 col-sm-6 image" @click="cloud_type = 'local'">
                              <div class="local-cloud-logo" :class="{active: cloud_type === 'local'}">
                                 <img src="/themes/default/img/local-cloud.svg" alt="local-cloud"
                                    width="90px">
                              </div>
                           </div>
                           <div class="col-12 col-sm-6 image" @click="cloud_type = 'aws'">
                              <div class="aws-cloud-logo" :class="{active: cloud_type === 'aws'}">
                                 <img src="/themes/default/img/aws-cloud.svg" alt="aws-cloud" width="120px">
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div v-if="cloud_type">
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.name')}}</label>
                        </div>
                        <div class="col-12">
                           <input v-validate="'required|max:30'" name="name" class="form-control"
                              v-model="name"
                              type="text" v-bind:placeholder="$t('single_video.name')"/>
                           <span v-show="errors.has('name')"
                              class=" is-danger">{{ errors.first('name') }}</span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.years')}}</label>
                        </div>
                        <div class="col-12">
                           <input v-validate="'required|numeric|max:4'" name="year" class="form-control"
                              v-model="year" type="text" v-bind:placeholder="$t('single_video.years')"
                              />
                           <span v-show="errors.has('year')"
                              class=" is-danger">{{ errors.first('year') }}</span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <div class="form-control-feedback" v-if="name === false">{{$t('single_video.movie_name')}}</div>
                           <label for="genres">{{$t('single_video.genres')}}</label>
                           <select multiple class="form-control" v-validate="'required'" name="genres"
                              v-model="genres" id="genres">
                              <option v-for="(item, index) in genres_list.genres" :key="index"
                                 :value="item.name">
                                 {{item.name}}
                              </option>
                           </select>
                        </div>
                        <span v-show="errors.has('genres')"
                           class=" is-danger">{{ errors.first('genres') }}</span>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label for="genres">{{$t('single_video.rating_system')}}</label>
                           <select class="form-control" v-validate="'required'" name="age" v-model="age"
                              id="age">
                              <option v-for="(item, index) in rating_system_list.rating_systems" :key="index"
                                 :value="item.name">
                                 {{item.name}}
                              </option>
                           </select>
                        </div>
                        <span v-show="errors.has('age')" class=" is-danger">{{ errors.first('age') }}</span>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.overview')}}</label>
                        </div>
                        <div class="col-12">
                           <textarea v-validate="'required'" name="overview" class="form-control" v-model="overview"
                              type="text" v-bind:placeholder="$t('single_video.overview')"
                              />
                           <span v-show="errors.has('overview')" class=" is-danger">{{ errors.first('overview') }}
                           </span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.runtime')}}
                           <small>{{$t('single_video.in_minutes')}}</small>
                           </label>
                        </div>
                        <div class="col-12">
                           <input v-validate="'required|decimal|max:3'" name="runtime" class="form-control"
                              v-model="runtime" type="text" v-bind:placeholder="$t('single_video.runtime')"
                              />
                           <span v-show="errors.has('runtime')" class=" is-danger">{{ errors.first('runtime') }}
                           </span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.rate')}}
                           <small>{{$t('single_video.from_one_ten')}}</small>
                           </label>
                        </div>
                        <div class="col-12">
                           <input v-validate="'required|decimal:1|max:3'" name="rate" class="form-control"
                              v-model="rate" type="text" v-bind:placeholder="$t('single_video.rate')"
                              />
                           <span v-show="errors.has('rate')"
                              class=" is-danger">{{ errors.first('rate') }}</span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.trailer')}}
                              <small>{{$t('single_video.youtube')}}</small>
                           </label>
                        </div>
                        <div class="col-12">
                           <input v-validate="'url|max:300'" name="youtube" class="form-control"
                              v-model="youtube" type="text" v-bind:placeholder="$t('single_video.trailer')"
                              />
                           <span v-show="errors.has('youtube')" class=" is-danger">{{ errors.first('youtube') }}
                           </span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label for="category">{{$t('single_video.category')}}</label>
                        </div>
                        <div class="col-12">
                           <select class="form-control" v-validate="'required'" name="category"
                              v-model="category" id="category">
                              <option v-for="(item, index) in categories_list.categories" :key="index"
                                 :value="item.id">
                                 {{item.name}}
                              </option>
                           </select>
                           <span v-show="errors.has('category')" class=" is-danger">{{ errors.first('category') }}</span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.poster')}}</label>
                        </div>
                        <div class="col-12">
                           <input type="file" id="poster" name="poster" v-validate="'required|image'"
                              @change="readImage('poster','posterFileImage')" class="inputfile">
                           <label id="posterLabel" for="poster">{{$t('single_video.choose_poster')}}
                           <br>
                           </label>
                           <img src="" id="posterFileImage" width="200" style="display: none;">
                           <span v-show="errors.has('poster')"
                              class=" is-danger">{{ errors.first('poster')}}</span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label>{{$t('single_video.backdrop')}}</label>
                        </div>
                        <div class="col-12">
                           <input type="file" id="backdrop" name="backdrop" v-validate="'required|image'"
                              @change="readImage('backdrop','backdropFileImage')"
                              class="inputfile">
                           <label id="backdropLabel" for="backdrop">{{$t('single_video.choose_backdrop')}}
                           <br>
                           </label>
                           <img src="" id="backdropFileImage" width="200" style="display: none;">
                           <span v-show="errors.has('backdrop')"
                              class=" is-danger">{{ errors.first('backdrop')}}</span>
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="col-12">
                           <label for="upload">{{$t('single_video.choose_way_upload')}}</label>
                           <select class="form-control" v-validate="'required'" name="upload_type_is"
                              v-model="upload_type_is" id="upload">
                              <option value="transcoding">{{$t('single_video.upload_transcoding')}}</option>
                              <option value="externalUrl">{{$t('single_video.upload_external_link')}}</option>
                           </select>
                           <span v-show="errors.has('upload_type_is')" class=" is-danger">{{ errors.first('upload_type_is') }}</span>
                        </div>
                     </div>
                     <transition name="menu-popover">
                        <div class="transcoding-section" v-show="upload_type_is == 'transcoding' ">
                           <div class="form-group" v-if="upload_type_is == 'transcoding'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}</label>
                              </div>
                              <div class="col-12">
                                 <input type="file" id="video" @change="infoShow('video','videoFileDetails')"
                                    class="inputfile">
                                 <label id="videoLabel" for="video">
                                    {{$t('single_video.choose_single_video')}}
                                    <br>
                                    <p id="videoFileDetails"></p>
                                 </label>
                              </div>
                           </div>
                           <div class="form-group" v-if="upload_type_is == 'transcoding'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}
                                 <small class="form-text text-muted">{{$t('single_video.select_preset')}}</small>
                                 </label>
                              </div>
                              <div class="col-12">
                                 <select multiple class="form-control" id="presets" v-validate="'required'"
                                    v-model="new_presets"
                                    style="height:200px;">
                                    <option v-for="(item, index) in presets" :key="index" :value="item">
                                       {{item.Name}}
                                    </option>
                                 </select>
                                 <span v-show="errors.has('presets')" class=" is-danger">{{ errors.first('presets') }}</span>
                              </div>
                           </div>
                        </div>
                     </transition>
                     <transition name="menu-popover">
                        <div class="external-link" v-show="upload_type_is == 'externalUrl'">
                           <div class="form-group" v-if="upload_type_is == 'externalUrl'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}
                                 <small class="form-text text-muted">{{$t('single_video.external_link_360p')}}</small>
                                 </label>
                              </div>
                              <div class="col-12">
                                 <input class="form-control" v-model="video_link[0]" type="text"
                                    v-bind:placeholder="$t('single_video.external_link_360p_placeholder')"/>
                              </div>
                           </div>
                           <div class="form-group" v-if="upload_type_is == 'externalUrl'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}
                                 <small class="form-text text-muted">{{$t('single_video.external_link_480p')}}</small>
                                 </label>
                              </div>
                              <div class="col-12">
                                 <input class="form-control" v-model="video_link[1]" type="text"
                                    v-bind:placeholder="$t('single_video.external_link_480p_placeholder')"/>
                              </div>
                           </div>
                           <div class="form-group" v-if="upload_type_is == 'externalUrl'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}
                                 <small class="form-text text-muted">{{$t('single_video.external_link_720p')}}</small>
                                 </label>
                              </div>
                              <div class="col-12">
                                 <input class="form-control" v-model="video_link[2]" type="text"
                                    v-bind:placeholder="$t('single_video.external_link_720p_placeholder')"/>
                              </div>
                           </div>
                           <div class="form-group" v-if="upload_type_is == 'externalUrl'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}
                                 <small class="form-text text-muted">{{$t('single_video.external_link_1080p')}}</small>
                                 </label>
                              </div>
                              <div class="col-12">
                                 <input class="form-control" v-model="video_link[3]" type="text"
                                    v-bind:placeholder="$t('single_video.external_link_1080p_placeholder')"/>
                              </div>
                           </div>
                           <div class="form-group" v-if="upload_type_is == 'externalUrl'">
                              <div class="col-12">
                                 <label>{{$t('single_video.video')}}
                                 <small class="form-text text-muted">{{$t('single_video.external_link_4k')}}</small>
                                 </label>
                              </div>
                              <div class="col-12">
                                 <input class="form-control" v-model="video_link[4]" type="text"
                                    v-bind:placeholder="$t('single_video.external_link_4k_placeholder')"/>
                              </div>
                           </div>
                        </div>
                     </transition>
                  </div>
               </div>
               <div class="col-12 col-sm-6">
                  <div v-if="cloud_type">
                     <form class="cover__form" id="form">
                        <div class="form-group">
                           <div class="col-12">
                              <div class="alert alert-info" role="alert">
                                 <strong>{{$t('single_video.if_upload')}}</strong> {{$t('single_video.required_name_image')}}
                              </div>
                           </div>
                        </div>
                        <div class="form-group">
                           <div class="col-12">
                              <label>{{$t('single_video.instructor_one')}}</label>
                           </div>
                           <div class="col-12">
                              <input v-validate="'max:50'" name="name1" class="form-control"
                                 v-model="cast1" type="text" v-bind:placeholder="$t('single_video.name')"/>
                              <br>
                              <span v-show="errors.has('name1')" class=" is-danger">{{ errors.first('name4') }}</span>
                              <input type="file" id="cast1" name="cast4" v-validate="'image'"
                                 @change="readImage('cast1','cast1FileImage')" class="inputfile">
                              <label id="cast1Label" for="cast1">{{$t('single_video.choose_image')}}
                              <br>
                              </label>
                              <img src="" id="cast1FileImage" width="200" style="display: none;">
                              <span v-show="errors.has('cast1')"
                                 class=" is-danger">{{ errors.first('cast1')}}</span>
                           </div>
                        </div>
                        <div class="form-group">
                           <div class="col-12">
                              <label>{{$t('single_video.instructor_two')}}</label>
                           </div>
                           <div class="col-12">
                              <input v-validate="'max:50'" name="name2" class="form-control"
                                 v-model="cast2" type="text" v-bind:placeholder="$t('single_video.name')"/>
                              <br>
                              <span v-show="errors.has('name2')" class=" is-danger">{{ errors.first('name2') }}
                              </span>
                              <input type="file" id="cast2" name="cast2" v-validate="'image'"
                                 @change="readImage('cast2','cast2FileImage')" class="inputfile">
                              <label id="cast2Label" for="cast2">{{$t('single_video.choose_image')}}
                              <br>
                              </label>
                              <img src="" id="cast2FileImage" width="200" style="display: none;">
                              <span v-show="errors.has('cast2')"
                                 class=" is-danger">{{ errors.first('cast2')}}</span>
                           </div>
                        </div>
                        <div class="form-group">
                           <div class="col-12">
                              <label>{{$t('single_video.instructor_three')}}</label>
                           </div>
                           <div class="col-12">
                              <input v-validate="'max:50'" name="name3" class="form-control"
                                 v-model="cast3" type="text" v-bind:placeholder="$t('single_video.name')"/>
                              <br>
                              <span v-show="errors.has('name3')" class=" is-danger">{{ errors.first('name3') }}
                              </span>
                              <input type="file" id="cast3" name="cast3" v-validate="'image'"
                                 @change="readImage('cast3','cast3FileImage')" class="inputfile">
                              <label id="cast3Label" for="cast3">{{$t('single_video.choose_image')}}
                              <br>
                              </label>
                              <img src="" id="cast3FileImage" width="200" style="display: none;">
                              <span v-show="errors.has('cast3')"
                                 class=" is-danger">{{ errors.first('cast3')}}</span>
                           </div>
                        </div>
                        <div class="form-group">
                           <div class="col-12">
                              <label>{{$t('single_video.instructor_four')}}</label>
                           </div>
                           <div class="col-12">
                              <input v-validate="'max:50'" name="name4" class="form-control"
                                 v-model="cast4" type="text" v-bind:placeholder="$t('single_video.name')"/>
                              <br>
                              <span v-show="errors.has('name4')" class=" is-danger">{{ errors.first('name4') }}
                              </span>
                              <input type="file" id="cast4" name="cast4" v-validate="'image'"
                                 @change="readImage('cast4','cast4FileImage')" class="inputfile">
                              <label id="cast4Label" for="cast4">{{$t('single_video.choose_image')}}
                              <br>
                              </label>
                              <img src="" id="cast4FileImage" width="200" style="display: none;">
                              <span v-show="errors.has('cast4')"
                                 class=" is-danger">{{ errors.first('cast4')}}</span>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <div v-if="cloud_type">
                  <div class="col-12">
                     <div class="form-group">
                        <div class="col-12">
                           <button class="btn btn-sm btn-warning" v-if="!disabled_button"
                              @click="MOVIE_UPLOAD(name)">{{$t('single_video.upload')}}
                           </button>
                           <button class="btn btn-md btn-warning" v-if="disabled_button" disabled>{{$t('single_video.loading')}}
                           </button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>
<script>
   const alertify = require("alertify.js");
   import {
       mapState
   } from "vuex";
   
   
   export default {
       data() {
           return {
               name: "",
               year: "",
               genres: [],
               age: null,
               overview: "",
               runtime: "",
               rate: "",
               youtube: "",
               id: "",
               video_link: [],
               embed: "",
               presets: [
                   {
                       'Name': 'HLS - 16000Kilorate - 4K',
                       'Resolution': '4k',
                       'Container': 'ts'
                   },
                   {
                       'Name': 'HLS - 4000Kilorate - 1080P',
                       'Resolution': '1080',
                       'Container': 'ts'
                   },
                   {
                       'Name': 'HLS - 2500Kilorate - 720P',
                       'Resolution': '720',
                       'Container': 'ts'
                   },
                   {
                       'Name': 'HLS - 700Kilorate - 480P',
                       'Resolution': '480',
                       'Container': 'ts'
                   },
                   {
                       'Name': 'HLS - 400Kilorate - 320P',
                       'Resolution': '320',
                       'Container': 'ts'
                   },
                   {
                       'Name': 'Generic - 4K',
                       'Resolution': '4k',
                       'Container': 'mp4'
                   },
                   {
                       'Name': 'Generic - 1080P',
                       'Resolution': '1080',
                       'Container': 'mp4'
                   },
                   {
                       'Name': 'Generic - 720P',
                       'Resolution': '720',
                       'Container': 'mp4'
                   },
                   {
                       'Name': 'Generic - 480P',
                       'Resolution': '480',
                       'Container': 'mp4'
                   },
                   {
                       'Name': 'Generic - 320P',
                       'Resolution': '320',
                       'Container': 'mp4'
                   }
               ],
               new_presets: [],
               count: "",
               //Cast
               cast1: "",
               cast2: "",
               cast3: "",
               cast4: "",
               upload_type_is: false,
               disabled_button: false,
               upload_data: {
                   id: null,
                   api: {
                       show: false,
                       progress: 0,
                       success_message: null,
                       error_message: null,
                   },
                   upload: {
                       show: false,
                       progress: 0,
                       success_message: null,
                       error_message: null,
                       message: null
                   },
                   subtitle: {
                       progress: 0,
                       success_message: null,
                       error_message: null,
                   }
               },
               uploadFormData: new FormData(),
               apiFormData: new FormData(),
               cloud_type: false,
               category: null
           };
       },
   
   
       computed: mapState({
           countUploadData: state => state.event.data_count,
           uploadData: state => state.event.upload_data,
           categories_list: state => state.categories.data,
           genres_list: state => state.genres.data,
           rating_system_list: state => state.rating_system.data
       }),
   
       created() {
           this.$store.dispatch('GET_CATEGORIES_BY_SORT', 'single');
           this.$store.dispatch('GET_GENRES_BY_SORT');
           this.$store.dispatch('GET_RATING_SYSTEM_BY_SORT');
       },
   
       mounted() {
           // Listen for the 'NewBlogPost' event in the 'team.1' private channel
           Echo.channel('progress').listen('EventTrigger', (payload) => {
               if (payload.progress.progress < 2) {
                   this.$store.commit('UPDATE_PROGRESS_DATA', {
                       key: this.countUploadData,
                       id: payload.progress.tmdb_id,
                       parameter: 'message',
                       object: 'upload',
                       value: payload.progress.message
                   });
                   this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                       key: this.countUploadData,
                       data: this.uploadData[this.countUploadData]
                   });
               }
   
               this.$store.commit('UPDATE_PROGRESS_DATA', {
                   key: this.countUploadData,
                   id: payload.progress.tmdb_id,
                   parameter: 'progress',
                   object: 'upload',
                   value: payload.progress.progress
               });
   
               this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                   key: this.countUploadData,
                   data: this.uploadData[this.countUploadData]
               });
   
           });
       },
   
       methods: {
           MOVIE_UPLOAD() {
               const cast1 = document.querySelector("#cast1");
               const cast2 = document.querySelector("#cast2");
               const cast3 = document.querySelector("#cast3");
               const cast4 = document.querySelector("#cast4");
               const poster = document.querySelector("#poster");
               const backdrop = document.querySelector("#backdrop");
               // Cast
               this.apiFormData.append("image1", cast1.files[0]);
               this.apiFormData.append("image2", cast2.files[0]);
               this.apiFormData.append("image3", cast3.files[0]);
               this.apiFormData.append("image4", cast4.files[0]);
               this.apiFormData.append("cast1", this.cast1);
               this.apiFormData.append("cast2", this.cast2);
               this.apiFormData.append("cast3", this.cast3);
               this.apiFormData.append("cast4", this.cast4);
   
               // Details
               this.apiFormData.append("name", this.name);
               this.apiFormData.append("year", this.year);
               this.apiFormData.append("genres", this.genres);
               this.apiFormData.append("overview", this.overview);
               this.apiFormData.append("runtime", this.runtime);
               this.apiFormData.append("rate", this.rate);
               this.apiFormData.append("youtube", this.youtube);
               this.apiFormData.append("poster", poster.files[0]);
               this.apiFormData.append("backdrop", backdrop.files[0]);
               this.apiFormData.append("age", this.age);
               this.apiFormData.append("category", this.category);
               // Cloud Type
               this.apiFormData.append("cloud_type", this.cloud_type);
   
   
               // Check count of upload data
               this.$store.commit('COUNT_UPLOAD_PROGRESS');
   
               // Upload video form data
               if (this.upload_type_is == 'transcoding') {
                   const video = document.querySelector("#video");
                   this.uploadFormData.append("video", video.files[0]);
                   this.uploadFormData.append("resolution", JSON.stringify(this.new_presets));
               } else if (this.upload_type_is == 'externalUrl') {
                   if (this.video_link.length > 0) {
                       this.uploadFormData.append("video_link", JSON.stringify(this.video_link));
                   } else {
                       this.uploadFormData.append("video_link", "empty");
                   }
   
               } else {
                   this.uploadFormData.append("embed", this.embed);
               }
   
   
               this.$validator.validateAll().then(result => {
                   if (result) {
   
                       // disable button
                       this.disabled_button = true;
   
                       this.upload_data.api.show = true;
                       this.upload_data.id = this.name;
   
                       this.$store.commit('SET_PROGRESS_DATA', this.upload_data);
                       this.$store.commit('SET_UPLOAD_PROGRESS', this.uploadData[this.countUploadData]);
                       this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                           key: this.countUploadData,
                           data: this.uploadData[this.countUploadData]
                       });
   
                       axios
                           .post("/api/admin/new/movie/customupload", this.apiFormData)
                           .then(
                               response => {
                                   if (response.status === 200) {
   
                                       this.$store.commit('UPDATE_PROGRESS_DATA', {
                                           key: this.countUploadData,
                                           parameter: 'progress',
                                           object: 'api',
                                           value: 100
                                       });
   
                                       this.$store.commit('UPDATE_PROGRESS_DATA', {
                                           key: this.countUploadData,
                                           parameter: 'success_message',
                                           object: 'api',
                                           value: response.data.message
                                       });
   
                                       this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                                           key: this.countUploadData,
                                           data: this.uploadData[this.countUploadData]
                                       });
   
                                       this.MOVIEVIDEO_S3(response.data.id);
   
                                       this.$router.push({
                                           name: "movies-manage"
                                       });
                                   }
                               },
                               error => {
                                   this.$store.commit('UPDATE_PROGRESS_DATA', {
                                       key: this.countUploadData,
                                       parameter: 'error_message',
                                       object: 'api',
                                       value: error.response.data.message
                                   });
                                   this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                                       key: this.countUploadData,
                                       data: this.uploadData[this.countUploadData]
                                   });
   
                                   this.disabled_button = false;
   
                               }
                           );
                   }
               });
           },
   
           MOVIEVIDEO_S3(id) {
               this.uploadFormData.append("id", id);
               this.uploadFormData.append("tmdb_id", this.name);
               // Cloud Type
               this.uploadFormData.append("cloud_type", this.cloud_type);
   
               this.upload_data.upload.show = true;
               this.$store.commit('UPDATE_PROGRESS_DATA', {
                   key: this.countUploadData,
                   parameter: 'show',
                   object: 'upload',
                   value: true,
               });
   
               // Progress
               const progress = {
                   headers: {
                       "content-type": "multipart/form-data"
                   },
                   onUploadProgress: progressEvent => {
                       this.upload_data.upload.progress = Math.round(
                           progressEvent.loaded * 100.0 / progressEvent.total
                       );
   
                       this.$store.commit('UPDATE_PROGRESS_DATA', {
                           key: this.countUploadData,
                           parameter: 'progress',
                           object: 'upload',
                           value: this.upload_data.upload.progress
                       });
   
                       this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                           key: this.countUploadData,
                           data: this.uploadData[this.countUploadData]
                       })
                   }
               };
               // Store data
               axios.post("/api/admin/new/movie/movievideo", this.uploadFormData, progress).then(
                   response => {
                       if (response.status === 200) {
   
                           this.$store.commit('UPDATE_PROGRESS_DATA', {
                               key: this.countUploadData,
                               parameter: 'success_message',
                               object: 'upload',
                               value: response.data.message
                           });
   
                           this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                               key: this.countUploadData,
                               data: this.uploadData[this.countUploadData]
                           });
   
   
                           alertify.logPosition("top right");
                           alertify.success("Successful upload");
                           setTimeout(() => {
                               this.showProgress = false;
                           }, 500);
                       }
                   },
                   error => {
                       this.$store.commit('UPDATE_PROGRESS_DATA', {
                           key: this.countUploadData,
                           parameter: 'error_message',
                           object: 'upload',
                           value: error.response.data.message
                       });
                       this.$store.commit('UPDATE_UPLOAD_PROGRESS_DATA', {
                           key: this.countUploadData,
                           data: this.uploadData[this.countUploadData]
                       })
                   }
               );
           },
   
   
           readImage(id, outImage) {
               var img = document.getElementById(id);
               var tgt = img.target || window.event.srcElement,
                   files = tgt.files;
   
               // FileReader support
               if (FileReader && files && files.length) {
                   var fr = new FileReader();
                   fr.onload = function () {
                       var srcImage = document.getElementById(outImage);
                       srcImage.style.display = "block";
                       srcImage.src = fr.result;
                   };
                   fr.readAsDataURL(files[0]);
               } else {
                   // Not supported
                   // fallback -- perhaps submit the input to an iframe and temporarily store
                   // them on the server until the user's session ends.
               }
           },
   
           infoShow(idFiles, idDetails) {
               var x = document.getElementById(idFiles);
               var txt = "";
               if ("files" in x) {
                   for (var i = 0; i < x.files.length; i++) {
                       txt += "<br><strong>" + (i + 1) + ". file</strong><br>";
                       var file = x.files[i];
                       if ("name" in file) {
                           txt += "name: " + file.name + "<br>";
                       }
                       if ("size" in file) {
                           if (file.size < 1048576)
                               txt += "size:" + (file.size / 1024).toFixed(3) + "KB<br>";
                       }
                   }
               }
               document.getElementById(idDetails).innerHTML = txt;
           }
       }
   };
</script>