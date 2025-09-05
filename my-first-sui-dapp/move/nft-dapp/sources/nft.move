module loyalty_card::nftdapp {

    use sui::package::{Self};
    use sui::object;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string::String;

    // Loyalty NFT struct with points
    public struct Loyalty has key, store {
        id: UID,
        customer_id: address,
        image_url: String,
        points: u64,   // ✅ new feature
    }

    // Admin Capability
    public struct AdminCap has key, store {
        id: UID,
    } 

    // one time witness to create the publisher
    public struct NFTDAPP has drop {}

    // Initializer function
    fun init(otw: NFTDAPP, ctx: &mut TxContext) {
        package::claim_and_keep(otw, ctx);
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::public_transfer(admin_cap, tx_context::sender(ctx));
    }

    // Mint Loyalty NFT
    public fun mint_loyalty(customer_id: address, image_url: String, ctx: &mut TxContext) {
        let loyalty = Loyalty {
            id: object::new(ctx),
            customer_id,
            image_url,
            points: 0,  // ✅ start with 0 points
        };
        transfer::transfer(loyalty, customer_id);
    }

    // ✅ New Feature: Add points
    public entry fun add_points(loyalty: &mut Loyalty, amount: u64, _ctx: &mut TxContext) {
        loyalty.points = loyalty.points + amount;
    }

    // ✅ New Feature: Redeem points
    public entry fun redeem_points(loyalty: &mut Loyalty, amount: u64, _ctx: &mut TxContext) {
        assert!(loyalty.points >= amount, 0); // prevent negative points
        loyalty.points = loyalty.points - amount;
    }

    // ✅ View function: Get points
    public fun get_points(loyalty: &Loyalty): u64 {
        loyalty.points
    }
}