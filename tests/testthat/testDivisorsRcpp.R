context("testing divisorsRcpp")

test_that("divisorsRcpp generates correct numbers", {
    expect_equal(divisorsRcpp(0), numeric(0))
    expect_equal(length(divisorsRcpp(1:100)), 100)
    expect_equal(divisorsRcpp(2), c(1, 2))
    expect_equal(divisorsRcpp(1), 1)
    expect_equal(divisorsRcpp(-10), c(-10, -5, -2, -1, 1, 2, 5, 10))
    expect_equal(divisorsRcpp(1000), c(1,2,4,5,8,10,20,
                                       25,40,50,100,125,
                                       200,250,500,1000))
    expect_equal(divisorsRcpp(1000, TRUE), c(1,2,4,5,8,10,20,
                                             25,40,50,100,125,
                                             200,250,500,1000))
})

test_that("divisorsRcpp produces appropriate error messages", {
    expect_error(divisorsRcpp(2^53), "each element must be less than")
    expect_error(divisorsRcpp(-2^53), "each element must be less than")
    expect_error(divisorsRcpp("10"), "must be of type numeric or integer")
    expect_error(divisorsRcpp(100, namedList = "TRUE"), "Not compatible with requested type")
})