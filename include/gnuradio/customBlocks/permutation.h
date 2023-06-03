/* -*- c++ -*- */
/*
 * Copyright 2023 Ram Akshayver Pal.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#ifndef INCLUDED_CUSTOMBLOCKS_PERMUTATION_H
#define INCLUDED_CUSTOMBLOCKS_PERMUTATION_H

#include <gnuradio/customBlocks/api.h>
#include <gnuradio/sync_block.h>
#include <vector>

namespace gr {
namespace customBlocks {

/*!
 * \brief Permutation.
 * \ingroup customBlocks_coding_blk
 */
class CUSTOMBLOCKS_API permutation : virtual public sync_block
{
public:
    // gr::customBlocks::permutation::sptr
    typedef std::shared_ptr<permutation> sptr;

    static sptr
    make(int K, const std::vector<int>& TABLE, int SYMS_PER_BLOCK, size_t NBYTES);

    virtual int K() const = 0;
    virtual std::vector<int> TABLE() const = 0;
    virtual int SYMS_PER_BLOCK() const = 0;
    virtual size_t BYTES_PER_SYMBOL() const = 0;

    virtual void set_K(int K) = 0;
    virtual void set_TABLE(const std::vector<int>& table) = 0;
    virtual void set_SYMS_PER_BLOCK(int spb) = 0;
};

} /* namespace customBlocks */
} /* namespace gr */

#endif /* INCLUDED_CUSTOMBLOCKS_PERMUTATION_H */
