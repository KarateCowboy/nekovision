use std::ops::Deref;
use serde::{Deserialize, Serialize};
use serde_wasm_bindgen::to_value;
use wasm_bindgen::prelude::*;
use wasm_bindgen_futures::spawn_local;
use yew::prelude::*;
use yew::Properties;
use web_sys;

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
    Search(String),
    None,
}

#[derive(Eq, PartialEq, Clone, Debug)]
pub enum Page {
    Main,
    SearchResults(String),
    NotFound,
}

#[derive(Eq, PartialEq, Clone, Debug, Properties)]
pub struct State {
    pub current_page: Page,
}


pub async fn dispatch(message: Message, state: &UseStateHandle<State>) {
    web_sys::console::log_1(&String::from("dispatching").into()); // if uncommented will print

    let current_state = state.deref().clone();
    let (new_state, _) = update(current_state, message).await;
    web_sys::console::log_1(&String::from("dispatching").into()); // if uncommented will print
    state.set(new_state);
}

pub async fn update(app_state: State, message: Message) -> (State, Message) {
    let (new_state, new_message) = match message {
        Message::Navigate(page) => {
            return set_page(&app_state, page.clone());
        }
        Message::Search(query) => (State { current_page: Page::SearchResults(query) }, Message::None),
        _ => (app_state, Message::None),
        Message::None => (app_state, Message::None),
    };
    return match new_message {
        Message::None => (new_state, new_message),
        _ => Box::pin(update(new_state, new_message)).await
    };
}

pub fn set_page(state: &State, page: Page) -> (State, Message) {
    return match page {
        Page::Main => (State { current_page: Page::Main }, Message::None),
        Page::SearchResults(query) => (State { current_page: Page::SearchResults(query.clone()) }, Message::Search(query.clone())),
        Page::NotFound => (state.clone(), Message::None)
    };
}

#[derive(PartialEq, Properties)]
pub struct ProviderProps {
    pub children: Children,
}

#[function_component(App)]
pub fn app() -> Html {
    let ctx = use_state(|| State { current_page: Page::Main });

    let onclick = {
        let local_ctx = ctx.clone();
        Callback::from(move |_| {
            let local_ctx = local_ctx.clone();
            spawn_local(async move {
                let greeting = String::from("hello console");
                web_sys::console::log_1(&greeting.into()); // if uncommented will print
                println!("Dispatching");
                dispatch(Message::Navigate(Page::SearchResults("Smidget Freestyle Don't Bother Me".to_string())), &local_ctx).await;
            });
        })
    };

    html! {
        <ContextProvider<State> context={(*ctx).clone()}>
        <page>
         if ctx.current_page == Page::Main {
            <input type="text" id="search" placeholder="Search for time wasters..."/>
            <button type="submit" {onclick} >{ "Search" }</button>
        }else {
            <SearchResults />
        }
        </page>
        </ContextProvider<State>>
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

#[function_component(Partial)]
fn partial() -> Html {
    let ctx = use_context::<State>().expect("blarg");
    let some_str = String::from("Some string");
    html! {
        <div>
           <div>{ format!("{:?}",ctx.current_page) }</div>
           <h1>{"This is a partial component "}</h1>
        </div>
    }
}

#[function_component(SearchResults)]
fn search_results() -> Html {
    let ctx = use_context::<State>().expect("blarg");
    html! {
        <page>
            <h1>{"Search Results Page"}</h1>
            <ul id="video-list"></ul>
        </page>
    }
}

#[function_component(NotFound)]
fn not_found() -> Html {
    html! {
        <h1>{"404 Not Found"}</h1>
    }
}
