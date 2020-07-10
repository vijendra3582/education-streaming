<template>
<div class="app">

    <div class="col-12 col-sm-4 pull-right" v-if="show_alert_services" style="z-index: 10000;position: fixed;right: 0;bottom: 0px;width: 100%;">

        <div class="alert alert-warning" role="alert" v-for=" (item, index) in data_services_error" v-if="!item.status" :key="index">
            {{item.message}}
        </div>

    </div>

    <div class="custom-navbar fixed-top">
        <div class="navbar-content">

            <div class="hidden-md-up collapse" @click="mobile_sidebar = !mobile_sidebar"></div>

            <div class="hidden-sm-down logo">
                <img src="/images/logo_blue.svg" alt="logo" width="100%">
                    </div>
                <div class="profile float-right">

                    <div class="dropdown">
                        <button class="dropdown-toggle" type="button" id="dropdownNavbar" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img :src="$auth.getUserInfo('image')" onError="this.onerror=null;this.src='/images/avatar.png';" width="23px">
                            {{$auth.getUserInfo('name')}}
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownNavbar">
                            <router-link class="dropdown-item" :to="{name: 'profile'}">Setting</router-link>
                            <div class="dropdown-item" @click="LOGOUT">Logout</div>
                        </div>
                    </div>

                </div>

                <div class="hidden-md-up" id="side-navbar" style="width: 100%; background: #fff;" v-if="mobile_sidebar">
                    <div id="content">
                        <ul class="list-unstyled" id="list-menu">
                            <li>
                                <router-link :to="{name:'dashboard'}">
                                    <img src="/themes/default/img/admin/dashboard.svg" alt="dashboard" width="23px">
                                    <strong>{{$t('nav.dashboard')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <div class="c-dropdown">

                                    <div class="ref-dropdown" @click="SHOW_DROPDOWN('single')">
                                        <img src="/themes/default/img/admin/movie.svg" alt="single" width="23px">
                                        <strong>{{$t('nav.single_videos')}}</strong>
                                        <span class="c-dropdown-icon-up" v-if="dropdown_single == 'single' "></span>
                                        <span class="c-dropdown-icon-down" v-if="dropdown_single != 'single'"></span>

                                    </div>

                                    <div class="c-dropdown-animation">
                                        <transition name="menu-popover">
                                            <div class="c-dropdown-content" v-show="dropdown_single == 'single'">
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'single-manage'}">{{$t('nav.manage_single_video')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'single-api'}">{{$t('nav.api_upload')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'single-custom'}">{{$t('nav.custom_upload')}}</router-link>
                                                </div>
                                            </div>
                                        </transition>

                                    </div>
                                </div>

                            </li>

                            <li>

                                <div class="c-dropdown">

                                    <div class="ref-dropdown" @click="SHOW_DROPDOWN('series')">
                                        <img src="/themes/default/img/admin/series.svg" alt="series" width="23px">
                                        <strong>{{$t('nav.courses')}}</strong>
                                        <span class="c-dropdown-icon-up" v-if="dropdown_series == 'series' "></span>
                                        <span class="c-dropdown-icon-down" v-if="dropdown_series != 'series'"></span>

                                    </div>

                                    <div class="c-dropdown-animation">
                                        <transition name="menu-popover">
                                            <div class="c-dropdown-content" v-show="dropdown_series == 'series'">
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'series-manage'}">{{$t('nav.manage_courses')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'series-api'}">{{$t('nav.course')}} {{$t('nav.api_upload')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'series-custom'}">{{$t('nav.course')}} {{$t('nav.custom_upload')}}</router-link>
                                                </div>
                                            </div>
                                        </transition>

                                    </div>

                                </div>

                            </li>
                            <li>
                                <router-link :to="{name:'categories-manage'}">
                                    <img src="/themes/default/img/admin/categories.svg" alt="Categories" width="20px">
                                    <strong>{{$t('nav.categories')}}</strong>
                                </router-link>
                            </li>
                            <li>
                                <router-link :to="{name:'tv-manage'}">
                                    <img src="/themes/default/img/admin/tv.svg" alt="tv" width="23px">
                                    <strong>{{$t('nav.live_seminars')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'top-manage'}">
                                    <img src="/themes/default/img/admin/top.svg" alt="top" width="23px">
                                    <strong>{{$t('nav.top_slide')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'actors-manage'}">
                                    <img src="/themes/default/img/admin/actors.svg" alt="actors" width="23px">
                                    <strong>{{$t('nav.instructors')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'report-manage'}">
                                    <img src="/themes/default/img/admin/report.svg" alt="report" width="23px">
                                    <strong>{{$t('nav.reports')}}</strong>
                                    <div class="notification" v-if="notif_report > 0">
                                        <span>{{notif_report}}</span>
                                    </div>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'users-manage'}">
                                    <img src="/themes/default/img/admin/users.svg" alt="users" width="23px">
                                    <strong>{{$t('nav.customers')}}</strong>
                                </router-link>
                            </li>
                            <li>
                                <router-link :to="{name:'support-manage'}">
                                    <img src="/themes/default/img/admin/support.svg" alt="support" width="23px">
                                    <strong>{{$t('nav.support')}}</strong>
                                    <div class="notification" v-if="notif_support > 0">
                                        <span>{{notif_support}}</span>
                                    </div>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'file-manager', params: {link: 'root'}}">
                                    <img src="/themes/default/img/admin/folder.svg" alt="folder" width="23px">
                                    <strong>{{$t('nav.file_manager')}}</strong>
                                </router-link>
                            </li>

                            <li v-if="permission === 1">

                                <div class="c-dropdown">

                                    <div class="ref-dropdown" @click="SHOW_DROPDOWN('settings')">
                                        <img src="/themes/default/img/admin/settings.svg" alt="settings" width="23px">
                                        <strong>{{$t('nav.settings')}}</strong>
                                        <span class="c-dropdown-icon-up" v-if="dropdown_settings == 'settings' "></span>
                                        <span class="c-dropdown-icon-down" v-if="dropdown_settings != 'settings'"></span>

                                    </div>

                                    <div class="c-dropdown-animation">
                                        <transition name="menu-popover">
                                            <div class="c-dropdown-content" v-show="dropdown_settings == 'settings'">
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'themes'}">{{$t('nav.appearance')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'admins-users-manage'}">{{$t('nav.administrator_users')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'tmdb-manage'}">{{$t('nav.tmbd_api')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'transcoder-watermark'}">{{$t('nav.ffmpeg_setting')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'braintree-subscribe'}">{{$t('nav.braintree_setting')}}</router-link>
                                                </div>
                                            </div>
                                        </transition>

                                    </div>

                                </div>
                            </li>

                            <li class="help">
                                <router-link :to="{name:'help'}">
                                    <img src="/themes/default/img/admin/info.svg" alt="info" width="23px">
                                    <strong>{{$t('nav.help')}}</strong>
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

        <div class="mt-5">
            <div class="row">

                <div class="col-md-3 col-xl-2 hidden-sm-down" id="side-navbar">
                    <div id="content">
                        <ul class="list-unstyled" id="list-menu">
                            <li>
                                <router-link :to="{name:'dashboard'}">
                                    <img src="/themes/default/img/admin/dashboard.svg" alt="dashboard" width="23px">
                                    <strong>{{$t('nav.dashboard')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <div class="c-dropdown">

                                    <div class="ref-dropdown" @click="SHOW_DROPDOWN('single')">
                                        <img src="/themes/default/img/admin/movie.svg" alt="single" width="23px">
                                        <strong>{{$t('nav.single_videos')}}</strong>
                                        <span class="c-dropdown-icon-up" v-if="dropdown_single == 'single' "></span>
                                        <span class="c-dropdown-icon-down" v-if="dropdown_single != 'single'"></span>

                                    </div>

                                    <div class="c-dropdown-animation">
                                        <transition name="menu-popover">
                                            <div class="c-dropdown-content" v-show="dropdown_single == 'single'">
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'single-manage'}">{{$t('nav.manage_single_video')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'single-api'}">{{$t('nav.api_upload')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'single-custom'}">{{$t('nav.custom_upload')}}</router-link>
                                                </div>
                                            </div>
                                        </transition>

                                    </div>
                                </div>

                            </li>

                            <li>

                                <div class="c-dropdown">

                                    <div class="ref-dropdown" @click="SHOW_DROPDOWN('series')">
                                        <img src="/themes/default/img/admin/series.svg" alt="series" width="23px">
                                        <strong>{{$t('nav.courses')}}</strong>
                                        <span class="c-dropdown-icon-up" v-if="dropdown_series == 'series' "></span>
                                        <span class="c-dropdown-icon-down" v-if="dropdown_series != 'series'"></span>

                                    </div>

                                    <div class="c-dropdown-animation">
                                        <transition name="menu-popover">
                                            <div class="c-dropdown-content" v-show="dropdown_series == 'series'">
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'series-manage'}">{{$t('nav.manage_courses')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'series-api'}">{{$t('nav.course')}} {{$t('nav.api_upload')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'series-custom'}">{{$t('nav.course')}} {{$t('nav.custom_upload')}}</router-link>
                                                </div>
                                            </div>
                                        </transition>

                                    </div>

                                </div>

                            </li>
                            <li>
                                <router-link :to="{name:'categories-manage'}">
                                    <img src="/themes/default/img/admin/categories.svg" alt="Categories" width="20px">
                                    <strong>{{$t('nav.categories')}}</strong>
                                </router-link>
                            </li>
                            <li>
                                <router-link :to="{name:'tv-manage'}">
                                    <img src="/themes/default/img/admin/tv.svg" alt="tv" width="23px">
                                    <strong>{{$t('nav.live_seminars')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'top-manage'}">
                                    <img src="/themes/default/img/admin/top.svg" alt="top" width="23px">
                                    <strong>{{$t('nav.top_slide')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'actors-manage'}">
                                    <img src="/themes/default/img/admin/actors.svg" alt="actors" width="23px">
                                    <strong>{{$t('nav.instructors')}}</strong>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'report-manage'}">
                                    <img src="/themes/default/img/admin/report.svg" alt="report" width="23px">
                                    <strong>{{$t('nav.reports')}}</strong>
                                    <div class="notification" v-if="notif_report > 0">
                                        <span>{{notif_report}}</span>
                                    </div>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'users-manage'}">
                                    <img src="/themes/default/img/admin/users.svg" alt="users" width="23px">
                                    <strong>{{$t('nav.customers')}}</strong>
                                </router-link>
                            </li>
                            <li>
                                <router-link :to="{name:'support-manage'}">
                                    <img src="/themes/default/img/admin/support.svg" alt="support" width="23px">
                                    <strong>{{$t('nav.support')}}</strong>
                                    <div class="notification" v-if="notif_support > 0">
                                        <span>{{notif_support}}</span>
                                    </div>
                                </router-link>
                            </li>

                            <li>
                                <router-link :to="{name:'file-manager', params: {link: 'root'}}">
                                    <img src="/themes/default/img/admin/folder.svg" alt="folder" width="23px">
                                    <strong>{{$t('nav.file_manager')}}</strong>
                                </router-link>
                            </li>

                            <li v-if="permission === 1">

                                <div class="c-dropdown">

                                    <div class="ref-dropdown" @click="SHOW_DROPDOWN('settings')">
                                        <img src="/themes/default/img/admin/settings.svg" alt="settings" width="23px">
                                        <strong>{{$t('nav.settings')}}</strong>
                                        <span class="c-dropdown-icon-up" v-if="dropdown_settings == 'settings' "></span>
                                        <span class="c-dropdown-icon-down" v-if="dropdown_settings != 'settings'"></span>

                                    </div>

                                    <div class="c-dropdown-animation">
                                        <transition name="menu-popover">
                                            <div class="c-dropdown-content" v-show="dropdown_settings == 'settings'">
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'themes'}">{{$t('nav.appearance')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'admins-users-manage'}">{{$t('nav.administrator_users')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'tmdb-manage'}">{{$t('nav.tmbd_api')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'transcoder-watermark'}">{{$t('nav.ffmpeg_setting')}}</router-link>
                                                </div>
                                                <div class="c-dropdown-item">
                                                    <router-link :to="{name: 'braintree-subscribe'}">{{$t('nav.braintree_setting')}}</router-link>
                                                </div>
                                            </div>
                                        </transition>

                                    </div>

                                </div>
                            </li>

                            <li class="help">
                                <router-link :to="{name:'help'}">
                                    <img src="/themes/default/img/admin/info.svg" alt="info" width="23px">
                                    <strong>{{$t('nav.help')}}</strong>
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col col-md-9 col-xl-10 offset-md-3 offset-xl-2">
                    <router-view></router-view>
                </div>
            </div>
        </div>

        <upload-modal></upload-modal>
    </div>
</template>

<script>
import uploadModal from "./components/upload-modal";

export default {
  data() {
    return {
      dropdown_single: "",
      dropdown_series: "",
      dropdown_settings: "",
      permission: 0,
      mobile_sidebar: false,
      show_alert_services: false,
      data_services_error: [],
      notif_report: 0,
      notif_support: 0
    };
  },

  components: {
    "upload-modal": uploadModal
  },

  created() {
    axios.get("/api/admin/check/permission").then(response => {
      if (response.status === 200) {
        this.$auth.setDetails(
          response.data.data.email,
          response.data.data.name,
          response.data.data.image,
          response.data.data.role_id
        );

        this.permission = response.data.data.role_id;
      }
    });

    // Check services
    axios.get("/api/admin/get/checkservices").then(response => {
      if (
        !response.data.ffmpeg.status ||
        !response.data.braintree.status ||
        !response.data.tmdb.status
      ) {
        this.show_alert_services = true;
        this.data_services_error = response.data;
      }
      this.notif_report = response.data.notification.reports;
      this.notif_support = response.data.notification.supports;
    });
  },

  methods: {
    SHOW_DROPDOWN(x, t) {
      if (x == "single") {
        if (this.dropdown_single == x) {
          this.dropdown_single = false;
        } else {
          this.dropdown_single = x;
        }
      } else if (x == "series") {
        if (this.dropdown_series == x) {
          this.dropdown_series = false;
        } else {
          this.dropdown_series = x;
        }
      } else {
        if (this.dropdown_settings == x) {
          this.dropdown_settings = false;
        } else {
          this.dropdown_settings = x;
        }
      }
    },

    LOGOUT() {
      axios.post("admin/logout").then(res => {
        localStorage.removeItem("_a");
        location.reload();
      });
    }
  }
};
</script>
<style>
.k1_manage_table .title.p-2 {
    float: left;
    width: 100%;
    margin-left: 1.2rem;
    margin-top: 1rem;
    margin-bottom: 1rem;
}
.form-control, .form-control:hover, .form-control:focus, .form-control:active  {
    background: transparent;
    padding: 10px 10px;
    color: #7d7d7d;
    border: 2px solid #dadada;
    border-radius: 3px;
    font-size: .8rem;
    transition: 0s;
    width: 100%;
}
.form-control:focus, .form-control:active{
    border-color: #2196F3;
}
#videoLabel, #cast1Label, #cast2Label, #cast3Label, #cast4Label, #posterLabel, #watermarkLabel, #backdropLabel, #subtitleLabel {
    border: 2px solid #dedede;
}
.btn-warning:active, .btn-warning.active, .btn-warning:hover, .btn-warning:focus, .btn-warning.focus {
    border: 2px solid #03A9F4 !important;
}
.btn-warning {
    border: 2px solid #dadada !important;
    transition: 0s;
    padding: 9px 27px;
    font-weight: 600;
}
select option {
    padding: 6px 5px;
    cursor: pointer;
}
label {
    letter-spacing: 0;
    color: rgb(130, 135, 148);
    text-transform: uppercase;
    font-weight: 600;
    font-size: .8rem;
}
.col-12 + span.is-danger {
    margin-left: 17px;
}
</style>
