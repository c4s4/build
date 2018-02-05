#!/usr/bin/env python
# encoding: UTF-8

'''
Sample unit test.
'''

import unittest


class MainTest(unittest.TestCase):

    '''
    Test case for main module.
    '''

    def test_main(self):
        '''Test nothing.'''
        self.assertTrue(1 != 0)


if __name__ == '__main__':
    unittest.main()
