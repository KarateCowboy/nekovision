#[derive(Eq, PartialEq, Debug)]
pub enum Message {
    Navigate(Page),
    None,
}

#[derive(Eq, PartialEq, Clone, Debug)]
pub enum Page { Main, SearchResults }

#[derive(Eq, PartialEq, Clone, Debug)]
pub struct State {
    pub current_page: Page,
}

pub async fn update(app_state: State, message: Message) -> (State, Message) {
    match message {
        Message::Navigate(page) => (State { current_page: page }, Message::None),
        Message::None => (app_state, Message::None),
    }
}
