require 'jimson'

# ughhhhhhhhhh fine I'll make this already
# Look. If you're viewing this code, you probably have at least *some* opinion on cryptocurrency.
# Mine is...not positive. Cryptocurrencies make a lot of things worse for a lot of people,
# and its end goal is the financialization of everything, which is the worst possible outcome.
# I really wish I didn't feel like this was a necessity, but here we are.
# I've had to read *so fucking much* code and documentation written by the smuggest assholes on the planet,
# so I really hope this helps people.
# If you appreciate what I'm doing here, send me a tip! https://ko-fi.com/LemmaEOF
class Unchained
    extend Jimson::Handler

    # grabbing all of this from the ethereum wiki: https://eth.wiki/json-rpc/API
    public

    # web3, net RPCs

    # I *think* this is the right protocol version? fuck if I know, I don't use this shit
    def eth_protocolVersion
        "54"
    end

    def eth_syncing
        false
    end

    def eth_coinbase
        bullshit_long_number(20)
    end

    def eth_mining
        false
    end

    # TODO: fill this out I think?
    def eth_accounts
        Array.new
    end

    def eth_blockNumber
        "0x0"
    end

    def eth_getBalance(address, block)
        "0x62776F7021"
    end

    # TODO: fill this out I think?
    def eth_getStorageAt(address, position, block)
        "0x0"
    end

    # bunch of no-ops since Unchained doesn't do transactions

    def eth_getTransactionCount(address, state)
        "0x0"
    end

    def eth_getBlockTransactionCountByHash(hash)
        "0x0"
    end

    def eth_getBlockTransactionCountByNumber(number)
        "0x0"
    end

    # what the *hell* is an uncle in a cryptocurrency context?
    def eth_getUncleCountByBlockHash(hash)
        "0x0"
    end

    def eth_getUncleCountByBlockNumber(number)
        "0x0"
    end

    # eth_getCode, eth_sign, eth_signTransaction, eth_sendTransaction, eth_sendRawTransaction?

    def eth_call(object, quantity)
        "0x"
    end

    def eth_estimateGas(object, quantity)
        "0x"
    end

    def eth_getBlockByHash(hash, full)
        fake_block()
    end

    def eth_getBlockByNumber(number, full)
        fake_block()
    end

    def eth_getTransactionByHash(hash)
        fake_transaction()
    end

    def eth_getTransactionByBlockHashAndIndex(block_hash, index)
        fake_transaction()
    end

    def eth_getTransactionByBlockNumberAndIndex(block_number, index)
        fake_transaction()
    end

    def eth_getTransactionReceipt(hash)
        {
            transactionHash: bullshit_long_number(32),
            transactionIndex: "0x0",
            blockHash: bullshit_long_number(32),
            blockNumber: "0x0",
            from: bullshit_long_number(20),
            to: bullshit_long_number(20),
            cumulativeGasUsed: "0x0",
            gasUsed: "0x0",
            contractAddress: bullshit_long_number(20),
            logs: Array.new,
            logsBloom: bullshit_long_number(256) # jesus
        }
    end

    def eth_getUncleByBlockHashAndIndex(hash, index)
        fake_block()
    end

    def eth_getUncleByBlockNumberAndIndex(hash, index)
        fake_block()
    end

    def eth_getCompilers
        Array.new
    end

    def eth_compileSolidity(source)
        Hash.new
    end

    def eth_compileLLL(source)
        "0x0"
    end

    def eth_compileSerpent(source)
        "0x0"
    end

    def eth_newFilter(options)
        "0x0"
    end

    def eth_newBlockFilter(options)
        "0x0"
    end

    def eth_newPendingTransactionFilter(options)
        "0x0"
    end

    def eth_uninstallFilter(id)
        true
    end

    # this, eth_getFilterLogs, and eth_getLogs kinda...fucking blow? so many weird filter options
    def eth_getFilterChanges(id)
        bullshit_long_number(32)
    end

    def eth_getFilterLogs(id)
        bullshit_long_number(32)
    end

    def eth_getLogs(object)
        bullshit_long_number(32)
    end

    def eth_getWork
        [
            bullshit_long_number(32),
            bullshit_long_number(32),
            bullshit_long_number(32)
        ]
    end

    def eth_submitWork(nonce, powhash, digest)
        true
    end

    def eth_submitHashrate(hashrate, id)
        true
    end

    # db, shh RPCs

    private

    # there are a lot of bullshit long numbers, just fill 'em in with all zeros for now
    # why the hell is every single number in Ethereum a hex string? wtf
    # like I know JSON uses floats but this is ridiculous
    def bullshit_long_number(size)
        "0x" + ("00" * size)
    end

    # just null out a fake block since we aren't a blockchain
    def fake_block
        {
            number: "0x0",
            hash: bullshit_long_number(32),
            parentHash: bullshit_long_number(32),
            nonce: bullshit_long_number(8),
            sha3Uncles: bullshit_long_number(32),
            logsBloom: bullshit_long_number(256), # jesus
            transactionsRoot: bullshit_long_number(32),
            stateRoot: bullshit_long_number(32),
            miner: bullshit_long_number(20),
            difficulty: "0x0",
            totalDifficulty: "0x0",
            extraData: "0x0",
            size: "0x0",
            gasLimit: "0x0",
            gasUsed: "0x0",
            timestamp: "0x0",
            transactions: Array.new,
            uncles: Array.new
        }
    end

    # just null out a fake transaction since we aren't a blockchain
    def fake_transaction
        {
            blockHash: bullshit_long_number(32),
            blockNumber: "0x0",
            from: bullshit_long_number(20),
            gas: "0x0",
            gasPrice: "0x0",
            hash: bullshit_long_number(32),
            input: "0x0",
            nonce: "0x0",
            to: bullshit_long_number(20),
            transactionIndex: "0x0",
            value: "0x0",
            v: "0x0",
            r: bullshit_long_number(32),
            s: bullshit_long_number(32)
        }
    end
end

server = Jimson::Server.new(Unchained.new)
server.start # hosts at localhost:8999 for now