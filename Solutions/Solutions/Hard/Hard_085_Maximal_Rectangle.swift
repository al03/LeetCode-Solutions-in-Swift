/*

https://leetcode.com/problems/maximal-rectangle/

#85 Maximal Rectangle

Level: hard

Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing all ones and return its area.

Inspired by @morrischen2008 at https://leetcode.com/discuss/20240/share-my-dp-solution

*/

import Foundation

struct Hard_085_Maximal_Rectangle {
    static func maximalRectangle(matrix: [[Character]]) -> Int {
        if matrix.isEmpty {
            return 0
        }
        let m: Int = matrix.count
        let n: Int = matrix[0].count
        var left: [Int] = [Int](count: n, repeatedValue: 0)
        var right: [Int] = [Int](count: n, repeatedValue: n)
        var height: [Int] = [Int](count: n, repeatedValue: 0)
        var maxArea: Int = 0
        for var i = 0; i < m; i++ {
            var curr_left = 0
            var curr_right = n
            for var j = 0; j < n; j++ {
                if matrix[i][j] == "1" {
                    height[j] = height[j] + 1
                } else {
                    height[j] = 0
                }
            }
            for var j = 0; j < n; j++ {
                if matrix[i][j] == "1" {
                    left[j] = max(left[j], curr_left)
                } else {
                    left[j] = 0
                    curr_left = j + 1
                }
            }
            for var j = n - 1; j >= 0; j-- {
                if matrix[i][j] == "1" {
                    right[j] = min(right[j], curr_right)
                } else {
                    right[j] = n
                    curr_right = j
                }
            }
            for var j = 0; j < n; j++ {
                maxArea = max(maxArea, (right[j] - left[j]) * height[j])
            }
        }
        return maxArea
    }
}