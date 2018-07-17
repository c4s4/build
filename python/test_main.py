#!/usr/bin/env python
# encoding: UTF-8

'''
Sample unit test.
'''

import unittest
from $PACKAGE$.main import main


class MainTest(unittest.TestCase):

    '''
    Test case for main module.
    '''

    def test_main(self):
        '''Test nothing.'''
        main()


if __name__ == '__main__':
    unittest.main()
