contract;

dep inputs;

use inputs::INPUT;

fn part_1(input: [u64; 2245]) -> u64 {
    let mut result = 0;

    // TODO: Write your solution here
    let mut i = 0;

    let mut acc_calories = 0;

    while i < 2245 {
        i += 1;

        if input[i] == 0 {
            if result < acc_calories {
                result = acc_calories;
            }

            acc_calories = 0;
        } else {
            acc_calories += input[i];
        }
    }

    return result;
}

fn part_2(input: [u64; 2245]) -> u64 {
    let mut result = 0;

    // TODO: Write your solution here
    let mut top_three: [u64; 3] = [0, 0, 0];
    let mut local_min: (u64, u64) = (0, 0);
    let mut i = 0;
    let mut acc_calories = 0;

    while i < 2245 {
        i += 1;

        if input[i] == 0 {
            if local_min.0 < acc_calories {
                local_min.0 = acc_calories;
                top_three[local_min.1] = acc_calories;

                let mut j = 1;
                local_min.0 = top_three[0];
                local_min.1 = 0;
                while j < 3 {
                    if local_min.0 > top_three[j] {
                        local_min.0 = top_three[j];
                        local_min.1 = j;
                    }
                    j += 1;
                }
            }

            acc_calories = 0;
        } else {
            acc_calories += input[i];
        }
    }

    result = top_three[0] + top_three[1] + top_three[2];

    return result;
}

#[test]
fn test_part_1() {
    assert(part_1(INPUT) == 68775);
}

#[test]
fn test_part_2() {
    assert(part_2(INPUT) == 202585);
}
