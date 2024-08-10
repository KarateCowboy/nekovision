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

pub async fn dispatch(message: Message, state: &UseStateHandle<State>) {
    web_sys::console::log_1(&String::from("dispatching").into()); // if uncommented will print

    let current_state = state.deref().clone();
    let (new_state, _) = update(current_state, message).await;
    web_sys::console::log_1(&String::from("dispatching").into()); // if uncommented will print
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
                dispatch(Message::Navigate(Page::SearchResults), &local_ctx).await;
            });
        })
    };

    html! {
        <ContextProvider<State> context={(*ctx).clone()}>
        <page>
         if ctx.current_page == Page::Main {
            <input type="text" placeholder="Search for time wasters..."/>
            <button {onclick} >{ "Search" }</button>
        }else {
            <Partial />
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
