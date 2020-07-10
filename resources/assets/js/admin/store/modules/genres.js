const module = {
    state: {
        data: [],
        button_loading: false,
        spinner_loading: false,
    },
    actions: {

        /**
         * Get all channels
         *
         * @param {*} commit object
         * @param id int id
         */
        GET_GENRES_BY_SORT({ commit }, param) {
            commit('SPINER_LOAD');
            axios.get('/api/admin/get/genres').then(response => {
                if (response.status === 200) {
                    commit('SET_GENRES', response.data.data);
                    commit('SPINER_CLEAN');
                }
            });
        },

    },
    mutations: {
        SET_GENRES(state, data) {
            state.data = data;
        },
    },
    getters: {}
};
export default module;
