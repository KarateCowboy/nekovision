use serde::{Deserialize, Serialize};
use wasm_bindgen::prelude::*;
use wasm_bindgen_futures::spawn_local;
use yew::prelude::*;

#[wasm_bindgen]
extern "C" {
    #[wasm_bindgen(js_namespace = ["window", "__TAURI__", "core"])]
    async fn invoke(cmd: &str, args: JsValue) -> JsValue;
}

#[derive(Serialize, Deserialize)]
struct GreetArgs<'a> {
    name: &'a str,
}

#[function_component(App)]
pub fn app() -> Html {
    let greet_input_ref = use_node_ref();

    let name = use_state(|| String::new());

    let greet_msg = use_state(|| String::new());
    {
        let greet_msg = greet_msg.clone();
        let name = name.clone();
        let name2 = name.clone();
        use_effect_with(name2, move |_| {
            spawn_local(async move {
                if name.is_empty() {
                    return;
                }

                let args = serde_wasm_bindgen::to_value(&GreetArgs { name: &*name }).unwrap();
                // Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
                let new_msg = invoke("greet", args).await.as_string().unwrap();
                greet_msg.set(new_msg);
            });

            || {}
        });
    }

    let greet = {
        let name = name.clone();
        let greet_input_ref = greet_input_ref.clone();
        Callback::from(move |e: SubmitEvent| {
            e.prevent_default();
            name.set(
                greet_input_ref
                    .cast::<web_sys::HtmlInputElement>()
                    .unwrap()
                    .value(),
            );
        })
    };

    html! {
        <main class="container">
            <h1>{"NekoVision Viewer"}</h1>
            <h2><i>{"because the content shouldn't watch you back"}</i></h2>

            <div class="row">
                <iframe
                    width="560"
                    height="315"
                    src="https://www.youtube.com/embed/crEz8i6oVpI"
                    title="Nekovision video player"
                    frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen=false>
                </iframe>

            </div>

            // <form class="row" onsubmit={greet}>
            //     <input id="greet-input" ref={greet_input_ref} placeholder="Enter a name..." />
            //     <button type="submit">{"Greet"}</button>
            // </form>
            // <p>{ &*greet_msg }</p>
        </main>
    }
}
