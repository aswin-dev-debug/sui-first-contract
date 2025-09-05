module loyalty_card::nftdapp {

    use sui::package::{Self};
    use std::string::String;
    //nft struct
    public struct Loyalty has key,store {
        id: UID,
        customer_id: address,
        image_url:String,
    }
    //admin
    public struct AdminCap has key, store {
        id:UID,
    } 

    //one time witness to create the publisher
    public struct NFTDAPP has drop{}

    //intializer function
    fun init(otw:NFTDAPP,ctx:&mut TxContext ){
        package::claim_and_keep(otw,ctx);
        let admin_cap =AdminCap{
            id: object::new(ctx)
    };
    transfer::public_transfer(admin_cap,tx_context::sender(ctx));
    }

    //mint
    public fun mint_loyalty(customer_id: address,image_url:String,ctx: &mut TxContext){
        let loyalty =Loyalty{
            id:object :: new(ctx),
        customer_id,
        image_url
        };
        transfer::transfer(loyalty,customer_id);
    }

}