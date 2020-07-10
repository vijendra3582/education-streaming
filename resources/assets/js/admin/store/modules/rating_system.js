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
        GET_RATING_SYSTEM_BY_SORT({ commit }, param) {
            commit('SPINER_LOAD');
            axios.get('/api/admin/get/ratingSystems').then(response => {
                if (response.status === 200) {
                    commit('SET_RATING_SYSTEM', response.data.data);
                    commit('SPINER_CLEAN');
                }
            });
        },

    },
    mutations: {
        SET_RATING_SYSTEM(state, data) {
            state.data = data;
        },
    },
    getters: {}
};
export default module;
