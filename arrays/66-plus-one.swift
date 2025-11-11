/**
 * LeetCode Problem: 66 - Plus One
 * Difficulty: Easy
 * Link: https://leetcode.com/problems/plus-one/
 *
 * Problem Description:
 * -------------------
 * You are given a large integer represented as an array of digits (most significant digit first).
 * Increment the integer by one and return the resulting digits array.
 *
 * Rules:
 * - No leading zeros, except the number 0 itself (i.e. [0]).
 * - Each element is a digit 0-9.
 * - Handle carry when a 9 becomes 0.
 * - If all digits are 9 (e.g. 999) the result length increases (e.g. 1000).
 *
 * Examples:
 * ---------
 * Example 1:
 * Input: digits = [1,2,3]
 * Output: [1,2,4]
 * Explanation: 123 + 1 = 124
 *
 * Example 2:
 * Input: digits = [4,3,2,1]
 * Output: [4,3,2,2]
 *
 * Example 3:
 * Input: digits = [9]
 * Output: [1,0]
 *
 * Example 4:
 * Input: digits = [9,9,9]
 * Output: [1,0,0,0]
 *
 * Constraints:
 * ------------
 * - 1 <= digits.count <= 100
 * - 0 <= digits[i] <= 9
 */

import Foundation

class Solution {
    /**
     * Approach (Right-to-Left Carry Propagation):
     * ---------
     * 1. Iterate from the last index toward the front.
     * 2. If current digit < 9: increment it and return (done, no further carry).
     * 3. If current digit == 9: set it to 0 and continue (carry propagates left).
     * 4. If loop finishes (all were 9), prepend 1 (e.g. 999 -> 1000).
     *
     * Time Complexity: O(n) – worst case touches all digits (e.g. 999...9).
     * Space Complexity: O(1) extra (ignoring output array mutation; may allocate +1 in all-9 case).
     */
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        for i in stride(from: result.count - 1, through: 0, by: -1) {
            if result[i] < 9 {
                result[i] += 1
                return result
            }
            result[i] = 0 // carry continues
        }
        // All digits were 9
        result.insert(1, at: 0)
        return result
    }
}


// MARK: - Test Cases
func testSolution() {
    let solution = Solution()
    
    // Basic increment
    assert(solution.plusOne([1,2,3]) == [1,2,4], "Test 1 failed")
    print("✅ Test 1 passed")
    
    // Carry in middle
    assert(solution.plusOne([1,2,9]) == [1,3,0], "Test 2 failed")
    print("✅ Test 2 passed")
    
    // All nines single digit
    assert(solution.plusOne([9]) == [1,0], "Test 3 failed")
    print("✅ Test 3 passed")
    
    // All nines multi digit
    assert(solution.plusOne([9,9,9]) == [1,0,0,0], "Test 4 failed")
    print("✅ Test 4 passed")
    
    // Mixed digits with trailing 9
    assert(solution.plusOne([2,9,9]) == [3,0,0], "Test 5 failed")
    print("✅ Test 5 passed")
    
    // Edge: already large but no carry chain
    assert(solution.plusOne([1,9,8]) == [1,9,9], "Test 6 failed")
    print("✅ Test 6 passed")
    
    print("\n🎉 All Plus One tests passed!")
}

testSolution()
