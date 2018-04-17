pragma solidity ^0.4.19;

import "./token/StandardToken.sol";

contract SocialChain {
    struct Post {
        uint256 id;
        address owner;
        string content;
    }

    Post[] posts;

    uint256 postId;
    KarmaToken karmaToken;

    mapping (address => bool) joined;

    function SocialChain(address _karmaTokenAdress) public {
        karmaToken = KarmaToken(_karmaTokenAdress);
    }

    function publish(string _content) public {
        bool exists = joined[msg.sender];

        // when a user makes his first post we give him 100 KRM
        if(!exists) {
            karmaToken.generate(msg.sender, 100);
            joined[msg.sender] = true;
        }

        posts.push(Post(postId, msg.sender, _content));
        postId++;
    }
}