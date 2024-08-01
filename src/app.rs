use std::ops::Deref;
use serde::{Deserialize, Serialize};
use serde_wasm_bindgen::to_value;
use wasm_bindgen::prelude::*;
use wasm_bindgen_futures::spawn_local;
use yew::prelude::*;
use yew::Properties;

// use crate::update::Message::Navigate;
// use crate::update::*;
// use crate::update::Page::SearchResults;

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = ["window", "__TAURI__", "tauri"])]
    async fn invoke(cmd: &str, args: JsValue) -> JsValue;
}

/////////////////////////////////////////////////////////////////////////////////////
// Structs
/////////////////////////////////////////////////////////////////////////////////////

#[derive(Eq, PartialEq, Debug)]
pub enum Message {
    Navigate(Page),
    None,
}

#[derive(Eq, PartialEq, Clone, Debug)]
pub enum Page {
    Main,
    SearchResults,
    NotFound,
}

#[derive(Eq, PartialEq, Clone, Debug, Properties)]
pub struct State {
    pub current_page: Page,
}


pub fn dispatch(message: Message, state: &UseStateHandle<State>) {
    let current_state = state.deref().clone();
    let (new_state, _) = update(current_state, message);
    state.set(new_state);
}

pub async fn update(app_state: State, message: Message) -> (State, Message) {
    match message {
        Message::Navigate(page) => (State { current_page: page }, Message::None),
        Message::None => (app_state, Message::None),
    }
}

#[derive(PartialEq, Properties)]
pub struct ProviderProps {
    pub children: Children,
}

#[function_component(StateProvider)]
pub fn state_provider(props: &ProviderProps) -> Html {
    let state = use_state(|| State { current_page: Page::Main });

    let context = use_memo(|_| state.clone(), ());

    html! {
        <ContextProvider<UseStateHandle<State>> context={context}>
            { props.children.clone() }
        </ContextProvider<UseStateHandle<State>>>
    }
}

#[function_component(App)]
pub fn app() -> Html {
    let state = use_context::<UseStateHandle<State>>().expect("no ctx found");

    let onclick = {
        let state = state.clone();
        Callback::from(move |_| dispatch(Message::Navigate(Page::SearchResults), &state))
    };

    html! {
        <page>
            <input type="text" placeholder="Search for time wasters..."/>
            <button {onclick}>{ "Search" }</button>
        </page>
    }
}

#[function_component(Root)]
pub fn root() -> Html {
    html! {
        <StateProvider>
            <App />
        </StateProvider>
    }
}


/////////////////////////////////////////////////////////////////////////////////////
// View components
/////////////////////////////////////////////////////////////////////////////////////

#[function_component(Home)]
fn home() -> Html {
    html! {
        <h1>{"Welcome to Tauri App"}</h1>
    }
}

#[function_component(SearchResults)]
fn search_results() -> Html {
    html! {
        <h1>{"Search Results Page"}</h1>
    }
}

#[function_component(NotFound)]
fn not_found() -> Html {
    html! {
        <h1>{"404 Not Found"}</h1>
    }
}
