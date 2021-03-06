context("testing divisorsSieve")

test_that("divisorsSieve generates correct numbers", {
    options(scipen = 999)
    expect_equal(divisorsSieve(10)[[10]], c(1, 2, 5, 10))
    expect_equal(length(divisorsSieve(1000)), 1000)
    expect_equal(divisorsSieve(1000, 1009)[[10]], c(1, 1009))
    expect_equal(divisorsSieve(1)[[1]], 1)
    expect_equal(divisorsSieve(2, 2)[[1]], c(1, 2))
    expect_equal(divisorsSieve(997, 997)[[1]], c(1, 997))
    expect_equal(divisorsSieve(1000, 1000)[[1]], c(1,2,4,5,8,10,20,
                                                   25,40,50,100,125,
                                                   200,250,500,1000))
    
    expect_equal(divisorsSieve(100L), 
                 lapply(1:100, function(x) (1:x)[x %% (1:x) == 0]))
    
    ## lower bound less than sqrt(100) and greater than 1
    expect_equal(divisorsSieve(100L, 5), 
                 lapply(5:100, function(x) (1:x)[x %% (1:x) == 0]))
    
    expect_true(divisorsSieve(1, namedList = TRUE)==1)
    expect_true(divisorsSieve(1, 1, TRUE)==1)
    
    expect_equal(divisorsSieve(1000000L, 1000005L), 
                 lapply(1000000:1000005, function(x) (1:x)[x %% (1:x) == 0]))
    
    ## Test Names
    expect_equal(as.integer(names(divisorsSieve(100, namedList = TRUE))), 1:100)
    expect_equal(as.numeric(names(divisorsSieve(10^12, 10^12 + 100,
                                                namedList = TRUE))), (10^12):(10^12 + 100))
})

test_that("divisorsSieve produces appropriate error messages", {
    expect_error(divisorsSieve(-1), "bound1 must be a positive number")
    expect_error(divisorsSieve(0), "bound1 must be a positive number")
    expect_error(divisorsSieve(2^53), "bound1 must be a positive number less than")
    expect_error(divisorsSieve(2^53, 1), "must be a positive number less")
    expect_error(divisorsSieve(1, 2^53), "must be a positive number less")
    expect_error(divisorsSieve("10"), "must be of type numeric or integer")
    expect_error(divisorsSieve(2, "10"), "must be of type numeric or integer")
    expect_error(divisorsSieve(100, namedList = "TRUE"), "Not compatible with requested type")
})
