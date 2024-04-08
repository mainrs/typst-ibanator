use iban::calculate_checksum;
use wasm_minimal_protocol::*;

initiate_protocol!();

#[wasm_func]
pub fn check_iban(data: &[u8]) -> Vec<u8> {
    let res = calculate_checksum(data) == 1;
    vec![res as u8]
}
