export default function pageReducer(
    state={pages:[],sharedPages: [], myPages: [], currentPage: null,docSaved: false},
    action){
    
        switch (action.type){
            case "ADD_PAGE":
                return {...state,pages:[...state.pages, action.page],docSaved: true}
            case "ADD_PAGE_START":
                return {...state, docSaved: false}
            case "GET_ALL_PAGES":
              let pages = action.pages.flat()
              console.log("MYPAGE",pages)
            return{...state,pages:[pages],
            docSaved: false}
            case "GET_SHARED_PAGES":
            return {...state,sharedPages: [...state.sharedPages,action.sharedPages.data] }
            case "SHOW_PAGE":
                
                let page = action.page.attributes
               return {...state,currentPage: page}
            case "SHOW_PAGE_START":
                return {...state}
            case "GET_MY_PAGES":    

                return{...state,myPages:[...state.myPages.concat(action.pages)]}
            case "UPDATE_PAGE":
                return {...state,docSaved: true}
            default:
                return state
        }

}