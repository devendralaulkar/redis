start_server {tags {"bloom"}} {

    test "BINIT smoke test" {
        r del mykey
        assert {[r binit mykey 100 2] eq {OK}}
    }

    test "BINIT against existing key returns error" {
        r del mykey
        assert {[r binit mykey 100 2] eq {OK}}
        assert_error "ERR*" {r binit mykey 100 2}
    }

    test "BADD smoke test" {
        r del mykey
        assert {[r binit mykey 1000 2] eq {OK}}
        #fails on assert {[r binit mykey 100 2] eq {OK}}
        assert_equal 0 [r badd mykey test123]
        assert_equal 1 [r badd mykey test123]
    }

    test "BISMEMBER smoke test" {
        r del mykey
        assert {[r binit mykey 1000 2] eq {OK}}
        #fails on assert {[r binit mykey 100 2] eq {OK}}
        assert_equal 0 [r badd mykey test123]
        assert_equal 1 [r bismember mykey test123]
        assert_equal 0 [r bismember mykey test12]
    }
}
