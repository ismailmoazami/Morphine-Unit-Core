%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from openzeppelin.access.ownable.library import Ownable
from Empiric.contracts.starknet.src.compute_engines.summary_stats.ISummaryStats import ISummaryStats

@storage_var
func empiric_keys(key_name: felt) -> (res: felt) {
}

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(owner_: felt) {
    Ownable.initializer(owner_);
    return ();
}

@external
func add_empiric_key{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    key_name_, key_: felt
) { 
    Ownable.assert_only_owner();
    empiric_keys.write(key_name_, key_);
    return();
}


@view 
func get_empiric_key{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(key_name_: felt) -> (result: felt) {

    let (key) = empiric_keys.read(key_name_);
    return (result=key);
    
}

@external
func remove_empiric_key{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    key_: felt
) {
  Ownable.assert_only_owner();
  empiric_keys.write(key_, 0);
  return();
}